class PostsController < ApplicationController
  def index
    if !current_user.address.nil?
        @posts = Post.all.near(current_user.address, 5 )
        @posts_map = @posts
        @posts.each do |post|
          @favorite = Favorite.new(post: post, user: current_user)
        end

    elsif params[:tags_on] == "on" && !current_user.address.nil? && !current_user.tags.nil?
      current_user.tags.each do |tag|
        @user_tag = tag.name
      end
      Post.tags.all.each do |tag|
        @post_tag = tag.name
      end
      @posts = Post.where(@user_tag == @post_tag).near(@coordinates, 10)


    else
      @posts = Post.where.not(latitude: nil, longitude: nil)
      @posts_map = @posts
      @posts.each do |post|
        @favorite = Favorite.new(post: post, user: current_user)
      end
    end

    @markers = @posts_map.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
      }
    end
  end

  def show
    @post = Post.find(params[:id])
    @reviews = @post.reviews.sort {|x,y| y.votes_for.size <=> x.votes_for.size }
    @average = @post.average
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  if @post.save!
      redirect_to new_post_post_tag_path(@post)
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
    params.require(:post).permit(:title, :street, :city, :country, :description, :photo, :status, :begin_date, :end_date)
  end

end
