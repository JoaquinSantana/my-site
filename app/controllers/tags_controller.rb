class TagsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@tags = Tag.all
	end

	def show 
		@tag = Tag.find(params[:id])
	end

	def nowezdjecie
		@tag = Tag.new
		@tag.losowy_tag
		if @tag.save
			flash[:success] = "Nowy tag został dodany"
			redirect_to @tag
		else
			redirect_to :back
		end
	end

end