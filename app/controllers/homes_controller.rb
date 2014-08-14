class HomesController < ApplicationController

  def home
    @posts = Post.all.limit(6)
  end
end
