class CreateImagePairs < ActiveRecord::Migration
  def change
    create_table :image_pairs do |t|
      t.integer :votes_first, default: 0
      t.integer :votes_second, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
