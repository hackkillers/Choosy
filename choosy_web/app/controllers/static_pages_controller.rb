class StaticPagesController < ApplicationController
  def main
    if user_signed_in?
      @user_history = current_user.voting_history
      @image_pairs = ImagePair.order(created_at: :desc)
      @comment = Comment.new
    end
  end
end
