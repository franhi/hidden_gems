class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favorite = Favorite.new(post: @post, user: current_user)
    @favorite.save!
    # redirect_to posts_path
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    # redirect_to posts_path
  end

  private

  def favorite_params
    params.require(:favorite).permit(:post_id, :user_id)
  end
end
