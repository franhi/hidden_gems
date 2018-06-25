class ReviewsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @review = Review.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Event.find(params[:post_id])
    @review = Review.new
    @review.post = @post
    if @review.save
      redirect_to user_post_path(@user, @path)
    else
      render :new
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
