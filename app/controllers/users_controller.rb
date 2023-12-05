class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @last_posts = @user.last_posts
    @friendship = Friendship.new
  end

  def params_user
    params.require(:users).permit(:username)
  end
end
