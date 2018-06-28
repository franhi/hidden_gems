class ReportsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @report = Report.new
  end

  def create
    @post = Post.find(params[:post_id])
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.post = @post
    if @report.save!
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @report = Review.find(params[:id])
    @report.delete
    redirect_to post_path(@post)
  end


private

  def report_params
    params.require(:report).permit(:description)
  end
end
