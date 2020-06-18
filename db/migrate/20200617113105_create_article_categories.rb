class CreateArticleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :article_categories do |t|
      # t.integer :article_id
      # t.integer :category_id
      t.references :article, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
    # add_index :article_categories, :article_id
    # add_index :article_categories, :category_id
    # add_index :article_categories, [:article_id,:category_id],unique: true
  end
end
