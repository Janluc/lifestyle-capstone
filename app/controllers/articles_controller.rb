class ArticlesController < ApplicationController
  skip_before_action :require_login, only: [:index]

  # GET /articles or /articles.json
  def index
    @latest_article = Article.left_joins(:votes).group(:id).order('COUNT(votes.id) DESC').first
    @articles = Article.all
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

      if @article.save
        redirect_to articles_path
      else
        render @article
      end
  end

  private

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :text, :user_id, :category_id, :image)
  end
end
