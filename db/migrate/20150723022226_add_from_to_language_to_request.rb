class AddFromToLanguageToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :from_language, :integer
    add_column :requests, :to_language, :integer
  end
end
