class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user.id)
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
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:mood, :track_id)
  end
end
