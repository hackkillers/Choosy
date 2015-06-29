class StaticPagesController < ApplicationController
  def main
    @image_pairs = ImagePair.all
  end

  def signin
  end

  def signup
      @user = User.new
  end

  def profile
  end

  def newsfeed
  end
end
