class ArticlesController < ApplicationController
	#GET /articles
	def index	
		@articles = Article.all	
	end

	#GET articles/:id
	def show
		@article = Article.find(params[:id])		
	end

	#GET articles/new
	def new
		@article = Article.new	
	end

	#POST articles/create
	def create
		#@article = Article.new(title: params[:article][:title], body: params[:article][:body])
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render :new
		end		
	end

	#GET articles/:id/edit
	def edit
		@article = Article.find(params[:id])
	end

	#PUT articles/:id
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	#DELETE articles/:id
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path		
	end

	private
		def article_params
			params.require(:article).permit(:title, :body)
		end

end