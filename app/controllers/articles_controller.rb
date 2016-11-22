class ArticlesController < ApplicationController
  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
    ## this render call should be:
    # render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end

  before_action:authenticate_user!, except: [:index, :show]
  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
    puts @articles.inspect
  end

  def show
    @article = Article.find(params[:id])
    authorize! :read, @article
     # @author = Author.find(@user.id);
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.create(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize! :destroy, @article, :message => "Unable to delete this article."

    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end


end
