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

    # @results = Geocoder.search(@coordinates)
    # @location = @results.coordinates
      @posts = Post.all.near(@coordinates, 1)
      raise
   else
    # @user_location = params[:location]
    # @posts = Post.all.near(@user_location, 10 )
      @posts = Post.all
    end
  end
end


