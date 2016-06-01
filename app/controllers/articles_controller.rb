class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    
    # After saving we have to redirect user somewhere
    redirect_to articles_show(@article)
  end
  
  private
    def article_params
      # This whitelists the parameters
      params.require(:article).permit(:title, :description)
    end
end
