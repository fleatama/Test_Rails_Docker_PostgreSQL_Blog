class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    if params[:category_id]
      @selected_category = Category.find(params[:category_id])
      @articles = Article.from_category(params[:category_id]).page(params[:page])
    else
      @articles = Article.all.page(params[:page])
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
    # @article.article_categories.build
  end

  def create
    # @article = current_user.articles.build(article_params)
    @article = Article.new(article_params)
    category_list = params[:category_list].split(",")
    if @article.save
      @article.save_categories(category_list)
      flash[:success] = "記事を作成しました"
      redirect_to articles_url
    else
      render 'articles/new'
    end
  end

  def edit
    @article = Article.find(params[:id])
    @category_list = @article.categories.pluck(:name).join(",")
  end

  def update
    @article = Article.find(params[:id])
    category_list = params[:category_list].split(",")
    if @article.update_attributes(article_params)
      @article.save_categories(category_list)
      flash[:success] = "記事を更新しました"
      redirect_to articles_url
    else
      render 'edit'
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :category_ids)
    end
end
