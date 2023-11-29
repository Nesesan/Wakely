class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @last_posts = @user.last_posts
  end

  def user_avatar
    user = User.find!(user_id)
    if user.avatar.attached?
      image_tag user.avatar
    else
      image_tag 'default_avatar.jpg'
    end
  end

  def params_user
    params.require(:users).permit(:username)
  end
end
