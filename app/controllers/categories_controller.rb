class CategoriesController < ApplicationController
  respond_to :json

  def index
    @categories = Category.all
    respond_with @categories
  end

  def show
    @category = Category.find(params[:id])
    respond_with @category
  end

  def create
    @category = Category.create(params[:category])
    respond_with @category
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    respond_with @category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_with @category
  end
end
