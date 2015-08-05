class AddSlugToLanguage < ActiveRecord::Migration
  def change
    add_column :languages, :slug, :string, :unique => true
    add_index :languages, [:slug]
  end
end
