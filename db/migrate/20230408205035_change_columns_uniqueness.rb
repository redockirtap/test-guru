class ChangeColumnsUniqueness < ActiveRecord::Migration[6.1]
  def up
    change_column :categories, :title, :string, unique: true
    change_column :users, :email, :string, null: false
    change_column :users, :password, :string, null: false
  end

  def down
    change_column :categories, :title, :string
    change_column :users, :email, :string
    change_column :users, :password, :string
  end
end
