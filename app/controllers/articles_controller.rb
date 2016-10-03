class ArticlesController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
    @articles = Article.all
  end

  def show
    @category = Category.find_by(id: params[:category_id])
    @article = Article.where(id: params[:ids])
  end
end
