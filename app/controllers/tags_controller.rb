class TagsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@tags = Tag.all
	end

	def new
		@tag = Tag.new
	end

	def show 
		@tag = Tag.find(params[:id])
	end

	def create
		@tag = Tag.create(tag_params)
		@tag.tak(tag_params)

		if @tag.save
			flash[:success] = "Nowy tag został dodany"
			redirect_to @tag
		else
			render :edit
		end
	end

	private

		def tag_params
			params.require(:tag).permit(:title)			
		end

end