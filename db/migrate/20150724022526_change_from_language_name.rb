class ChangeFromLanguageName < ActiveRecord::Migration
  def change
    rename_column :requests, :from_language, :from_language_id
    rename_column :requests, :to_language, :to_language_id
  end
end
