class ReviewsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @review = Review.new
  end

  def create
    @post = Post.find(params[:post_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.post = @post
    if @review.save!
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to post_path(@post)
  end

  def upvote
    @review = Review.find(params[:id])
    if !current_user.voted_for? @review
        @review.liked_by current_user
    else
        @review.unliked_by current_user
    end

    redirect_to post_path(@review.post)
  end

  def downvote
    @review = Review.find(params[:id])
    @review.downvote_by current_user
    redirect_to post_path(@review.post)
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating, :photo)
  end
end
