class AddCaptionToImagePairs < ActiveRecord::Migration
  def change
  	add_column :image_pairs, :caption, :string
  end
end
