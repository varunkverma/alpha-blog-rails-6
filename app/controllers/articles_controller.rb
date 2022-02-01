class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def show
    end
    
    def new
        @article= Article.new
    end
  
    def create
        # @article = Article.new
        # @article.title = params[:article][:title]
        # @article.description = params[:article][:description]
        # puts @article.inspect
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article sucessfully created!"
            redirect_to @article
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        # reading the id from the url again
       
        if  @article.update(article_params)
            flash[:notice] = "Article successfully updated"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private # anything below is private
    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end