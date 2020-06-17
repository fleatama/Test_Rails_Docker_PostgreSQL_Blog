class Category < ApplicationRecord
  validates :name,presence:true,length:{maximum:50}
  has_many :article_categories, dependent: :destroy
  has_many :articles, through: :article_categories
end
