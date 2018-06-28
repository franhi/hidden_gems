class PagesController < ApplicationController

  def home
    @collection = Post.search_post(params[:query])
      if @collection.empty?
        @posts = Post.best_posts
      else
        @posts = Post.search_post(params[:query]).best_posts
      end

  end
end

