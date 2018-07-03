class PostTagsController < ApplicationController
   def new
    @post = Post.find(params[:post_id])
    @post_tag = PostTag.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post_tag = PostTag.new(post_tag_params)
    @post_tag.post = @post
    if @post_tag.save!
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post_tag = post_tag.find(params[:id])
    @post_tag.destroy
  end
end


def post_tag_params
  params.require(:post_tag).permit(:tag_id, :post_id)
end
