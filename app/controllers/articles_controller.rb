class ArticlesController < ApplicationController
  before_filter :require_article, :only => [:edit, :update, :destroy]

  def index
    @articles = Article.all
    @article = Article.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def edit
  end

  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path, notice: 'Article was successfully created.' }
      else
        format.html { render action: "index" }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to articles_path, notice: 'Article was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
    end
  end

  private
  def require_article
    @article = Article.find(params[:id])
  end
end
