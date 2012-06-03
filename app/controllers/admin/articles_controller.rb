class Admin::ArticlesController < Admin::HomeController
  respond_to :html, :json

  def index
    @articles = Article.all
    respond_with(@articles)
  end

  def show
    @article = Article.find(params[:id])
    respond_with(@article)
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
    @article = Article.find(params[:id])
    respond_with(@article)
  end

  def create
    @article = Article.new(params[:article])
    @article.save
    respond_with(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    respond_with(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

end
