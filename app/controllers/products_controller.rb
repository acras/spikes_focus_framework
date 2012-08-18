class ProductsController < ApplicationController
  respond_to :json

  def index
    @products = Product.all
    respond_with @products
  end

  def show
    @product = Product.find(params[:id])
    respond_with @product
  end

  def create
    @product = Product.create(params[:product])
    respond_with @product
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(params[:product])
    respond_with @product
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_with @product
  end
end
