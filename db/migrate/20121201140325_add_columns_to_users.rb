class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string

    add_column :users, :enabled, :boolean

    add_column :users, :profile, :text

  end
end
