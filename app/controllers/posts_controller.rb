class PostsController < ApplicationController
  def index
    @posts = Post.all

    @posts_map = Post.where.not(latitude: nil, longitude: nil)

    @markers = @posts_map.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
      }
    end

  end

  def show
    @post = Post.find(params[:id])
    @average = @post.average
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  if @post.save!
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save!
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :category, :street, :city, :country, :description, :photo, :status, :begin_date, :end_date)
  end

end
