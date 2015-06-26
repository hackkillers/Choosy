class CreateImagePairs < ActiveRecord::Migration
  def change
    create_table :image_pairs do |t|
      t.integer :votes_first
      t.integer :votes_second
      t.text :history, array: true, default: []
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
