class ArticlesController < ApplicationController

  def index
    @articles =  Article.all.to_a
    render json: @articles
  end

  def show
    @article = Article.find(params['id'])
    render json: @article
  end

  def update
    @article = Article.new(article_params)
    json = {}
    if @article.update(article_params)
      json = { article: article }
    else
      json = { errors: article.errors.full_messages }
    end
    render json: json
  end

  def update
    @article = Article.find(params['id'])
    json = {}
    if @article.update(article_params)
      json = { article: article }
    else
      json = { errors: article.errors.full_messages }
    end
    render json: json
  end

  def delete
    article = Article.find(parama[:id])
    article.destroy
    render 'index'
  end


  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
