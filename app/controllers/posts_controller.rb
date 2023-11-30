class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @comment.user = current_user
    if @post.save!
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    raise
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:mood, :track_id)
  end
end
