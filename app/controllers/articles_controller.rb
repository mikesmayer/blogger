class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
  end


  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' Created. Yay!"

    redirect_to article_path(@article)
  end


  def article_params
    params.require(:article).permit(:title, :body)
  end

  def destroy
  @article = Article.find(params[:id])
  @article.destroy

  flash.notice = "Article '#{@article.title}' Deleted. Good riddence!"

  redirect_to action: "index"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated. Yay!"

    redirect_to article_path(@article)
  end

end
