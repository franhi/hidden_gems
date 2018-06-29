class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(favorite_params)
    @post = Post.find(params[:post_id])
    @favorite.user_id = current_user.id
    @favorite.post = @post
    @favorite.save!
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
  end

  private

  def favorite_params
    params.require(:favorite).permit(:post_id, :user_id)
  end
end
