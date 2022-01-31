class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article= Article.new
    end
  
    def create
        # @article = Article.new
        # @article.title = params[:article][:title]
        # @article.description = params[:article][:description]
        # puts @article.inspect
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "Article sucessfully created!"
            redirect_to @article
        else
            render 'new'
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        # reading the id from the url again
        @article = Article.find(params[:id])
       
        if  @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article successfully updated"
            redirect_to @article
        else
            render 'edit'
        end

    end
end