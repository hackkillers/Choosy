class StaticPagesController < ApplicationController
  def main
    if user_signed_in?
      @user_history = current_user.voting_history
      @image_pairs = ImagePair.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
      @comment = Comment.new
    end
  end
end
