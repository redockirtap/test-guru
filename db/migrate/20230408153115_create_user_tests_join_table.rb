class CreateUserTestsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :tests, table_name: :user_tests do |t|
      t.index [:user_id, :test_id], unique: true
      # t.index [:test_id, :user_id]
    end
  end
end
