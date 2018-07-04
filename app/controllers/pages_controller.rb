class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    # @collection = Post.search_post(params[:query])
    # if @collection.empty?
      # @posts = Post.best_posts
    # else
      # @posts = Post.search_post(params[:query]).best_posts
    # end
    if !params[:latitude].nil?
      @coordinates = [params[:latitude], params[:longitude]]
      @posts = Post.all.near(@coordinates, 1)
    else
      @posts = Post.all
    end
  end
end


