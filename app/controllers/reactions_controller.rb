class ReactionsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @reaction = Reaction.find_or_initialize_by(emoji: reaction_params[:emoji], post: @post)
    @reaction.user = current_user
    if @reaction.save
      @reaction.increment_count
      respond_to do |format|
        format.text { render partial: "posts/emoji_list", locals: { post: @post }, formats: [:html] }
      end
    end
  end

  private

  def reaction_params
    params.require(:reaction).permit(:emoji)
  end
end
