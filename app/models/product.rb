class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :category_id

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :category, presence: true

  belongs_to :category
end
