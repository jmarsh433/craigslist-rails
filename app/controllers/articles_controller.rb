class ArticlesController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    category = Category.find(params[:category_id])

    @article.category = category
    @article.save

    redirect_to category_articles_url(category)
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      patch category_articles_url(category)
    else
      render 'edit'
    end
  end

private
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
