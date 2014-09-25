class HomesController < ApplicationController

  def home
    @posts = Post.all.limit(6)
    @contact = Contact.new

    @tags = Tag.all
  end
end
