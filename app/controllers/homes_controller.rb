class HomesController < ApplicationController

  def home
    @posts = Post.all.limit(6)
    @contact = Contact.new

    @tags = Tag.all.last(12).reverse
  end
end
