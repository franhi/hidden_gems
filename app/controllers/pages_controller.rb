class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    # if @collection.empty?
      # @posts = Post.best_posts
    # else
      # @posts = Post.search_post(params[:query]).best_posts
    # end
    if params[:latitude].nil? && params[:query].nil?
     @posts = Post.all
   elsif params[:query].nil?
    @coordinates = [params[:latitude], params[:longitude]]
    @posts = Post.near(@coordinates, 5)
    @posts = Post.all if @posts.empty?
   elsif !params[:query].nil?
    @coordinates = [params[:latitude], params[:longitude]]
    @posts = Post.search_post(params[:query]).near(@coordinates, 5)

   end


    if !@posts.empty?
      @markers = @posts.each do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
      }
      end
    end
 end
end


