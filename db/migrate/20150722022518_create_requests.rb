class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
