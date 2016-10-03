class ArticlesController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
    @articles = Article.all
  end

  def show
    @articles = Article.find_by(category_id: params[:category_id])
  end
end
