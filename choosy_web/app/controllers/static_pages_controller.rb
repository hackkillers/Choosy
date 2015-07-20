class StaticPagesController < ApplicationController
  def main
    @images = Image.all    
  end
end
