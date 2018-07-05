class UserTagsController < ApplicationController

  def new
    @user_tag = UserTag.new
  end

  def create
    @user_tag = UserTag.new(user_tag_params)
    @user_tag.user = current_user
    if @user_tag.save!
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'users/show' }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @user_tag = UserTag.find(params[:id])
    respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js
    end
    @user_tag.destroy
  end
end


def user_tag_params
  params.require(:user_tag).permit(:tag_id, :user_id)
end
