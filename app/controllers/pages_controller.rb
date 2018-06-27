class PagesController < ApplicationController

  def home
     @posts = Post.search_post(params[:query])
  end

end
