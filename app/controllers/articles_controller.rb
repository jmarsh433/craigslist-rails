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
      redirect_to category_article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to category_articles_url
  end

private
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
