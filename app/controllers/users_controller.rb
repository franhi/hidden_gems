class UsersController < ApplicationController

  def index
    # @post = current_user.save
  end


  def show
    @user = current_user
    @user_tag = UserTag.new
  end

  def create
    @user_tag = UserTag.new(user_tag_params)
    @user_tag.user = current_user
    if @user_tag.save!
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if @user.save!
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :address, :photo_cache)
  end

  def user_tag_params
    params.require(:user_tag).permit(:tag_id, :user_id)
  end
end
