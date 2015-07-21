class AddIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, :email
    add_index :users, :token
    add_index :users, :github_id
  end
end
