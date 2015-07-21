class AddVotingHistoryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :voting_history, :string, 
    array: true, default: [0]
  end
end
