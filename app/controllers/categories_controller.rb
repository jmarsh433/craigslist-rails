class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @categories = Category.find_by(id: params[:catagory_id])
  end
end
