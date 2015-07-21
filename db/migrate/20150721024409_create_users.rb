class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :github_username, null: false
      t.string :email
      t.string :token, null: false
      t.integer :github_id

      t.timestamps null: false
    end
  end
end
