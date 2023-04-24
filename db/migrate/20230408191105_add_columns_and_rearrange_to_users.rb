class AddColumnsAndRearrangeToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :username, :name

    add_column :users, :email, :string
    add_column :users, :password, :string
  end
end
