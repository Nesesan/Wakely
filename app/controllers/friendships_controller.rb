class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.where(asker_id: current_user)
  end

  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.asker = current_user
    @friendship.save!
    redirect_to user_friendships_path(current_user)
  end

  private

  def friendship_params
    params.require(:friendship).permit(:receiver_id)
  end
end
