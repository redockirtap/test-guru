class AddProgressColumnToUserTests < ActiveRecord::Migration[6.1]
  def change
    add_column :user_tests, :progress, :integer, default: 0
  end
end
