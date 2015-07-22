class AddSlugsToTable < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string, :unique => true
    add_column :requests, :slug, :string, :unique => true
    add_index :requests, [:name, :url, :slug]
    add_index :requests, [:slug]
  end
end
