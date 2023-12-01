class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = Post.new(mood: post_params[:mood], track_id: post_params[:track_id], content: post_params[:content])
    @post.user = current_user
    if @post.save!
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search_music
    @spotify_service = GetSpotifyService.new
    @tracks = @spotify_service.get_tracks(params[:track])
    respond_to do |format|
      format.json { render json: { tracks: @tracks } }
    end
  end

  private

  def post_params
    params.require(:post).permit(:mood, :track_id, :content, :search_music)
  end
end
