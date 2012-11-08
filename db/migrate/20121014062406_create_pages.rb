class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.column :title, :string
      t.column :permalink, :string
      t.column :body, :text
      t.timestamps
    end
  end
end
