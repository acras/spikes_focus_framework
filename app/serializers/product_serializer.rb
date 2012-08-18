class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :category_id, :created_at

  # belongs_to :category
end
