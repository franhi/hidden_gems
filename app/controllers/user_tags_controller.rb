class UserTagsController < ApplicationController

  def new
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

  def destroy
    @user_tag = UserTag.find(params[:id])
    @user_tag.destroy

    respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js
    end
  end
end


def user_tag_params
  params.require(:user_tag).permit(:tag_id, :user_id)
end
