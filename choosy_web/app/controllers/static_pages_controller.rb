class StaticPagesController < ApplicationController
  def main
    @images = Image.all    
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
