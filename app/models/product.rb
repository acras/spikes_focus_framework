class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
end
