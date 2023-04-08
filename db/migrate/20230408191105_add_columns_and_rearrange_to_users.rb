class AddColumnsAndRearrangeToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :username, :name

    add_column :users, :email, :string
    add_column :users, :password, :string
    add_column :users, :tmp_created_at, :datetime, precision: 6, null: false, default: 0
    add_column :users, :tmp_updated_at, :datetime, precision: 6, null: false, default: 0

    # Copy the data.
    execute <<-SQL
              UPDATE users
              SET tmp_created_at = created_at;
              SET tmp_updated_at = updated_at;
               SQL

    # Remove the original column.
    remove_column :users, :created_at
    remove_column :users, :updated_at

    # Rename the new column.
    # Same name as the old column.
    rename_column :users, :tmp_created_at, :created_at
    rename_column :users, :tmp_updated_at, :updated_at
  end
end
