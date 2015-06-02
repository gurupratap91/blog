class ArticlesController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def new
    render template: "articles/new"
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
