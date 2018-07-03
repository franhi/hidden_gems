class PagesController < ApplicationController

  def home
    # @collection = Post.search_post(params[:query])
    # if @collection.empty?
      # @posts = Post.best_posts
    # else
      # @posts = Post.search_post(params[:query]).best_posts
    # end

    # @user_location = params[:location]
    # @posts = Post.all.near(@user_location, 10 )
    @posts = Post.all

    respond_to do |format|
      format.js { render :js => 'showPosition(position)' }
    end
  end
end

