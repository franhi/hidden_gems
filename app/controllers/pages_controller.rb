class PagesController < ApplicationController

  def home
    # @collection = Post.search_post(params[:query])
    #   if @collection.empty?
    #     @posts = Post.best_posts
    #   else
    #     @posts = Post.search_post(params[:query]).best_posts
    #   end

    if !current_user.address.nil?
        @posts = Post.all.near(current_user.address, 10 )
        @posts_map = @posts

    else
      @posts = Post.where.not(latitude: nil, longitude: nil)
      @posts_map = @posts
    end


    @markers = @posts_map.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
      }
    end
  end
end

