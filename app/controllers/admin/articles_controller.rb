class Admin::ArticlesController < Admin::HomeController
  respond_to :html, :json

  def index
    @articles = Article.all
    respond_with @articles
  end

  def show
    @article = Article.find params[:id]
    respond_with @article
  end

  def new
    @article = Article.new
    respond_with @article
  end

  def edit
    @article = Article.find params[:id]
  end

  def create
    @article = Article.new params[:article]
    flash[:notice] = 'Article was successfully created.' if @article.save
    respond_with :admin, @article
  end

  def update
    @article = Article.find params[:id]
    flash[:notice] = 'Article was successfully updated.' if @article.update_attributes(params[:article])
    respond_with :admin, @article
  end

  def destroy
    @article = Article.find params[:id]
    @article.destroy
    respond_with @article
  end
end
