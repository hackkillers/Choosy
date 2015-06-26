class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :avatar
      t.references :image_pair, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
