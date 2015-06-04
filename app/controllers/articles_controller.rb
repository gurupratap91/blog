class ArticlesController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    render template: "articles/new"
  end

  def create
    @article = Article.new(article_params)
    if @article.save
    redirect_to @article
    else
    render 'new'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
