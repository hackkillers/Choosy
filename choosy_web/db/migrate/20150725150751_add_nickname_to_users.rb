class AddNicknameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :nickname, :string, :limit => 15
  end
end
