class RemoveFirstAndLastNameColumnsAndAddNullableForName < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name

    change_column_null :users, :name, false
  end
end
