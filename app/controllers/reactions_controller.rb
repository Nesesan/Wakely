class ReactionsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @reaction = Reaction.new(reaction_params)
    @reaction.post = @post
    @reaction.user = current_user
    if @reaction.save
      @post.increment_reaction_count(@reaction)
      respond_to do |format|
        format.html { render_to_string(partial: "posts/emoji_list", locals: { post: @post }, formats: [:html]) }
      end
      head :ok
    end
  end

  private

  def reaction_params
    params.require(:reaction).permit(:emoji)
  end
end
