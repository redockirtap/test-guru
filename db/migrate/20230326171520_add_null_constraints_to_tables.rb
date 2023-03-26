class AddNullConstraintsToTables < ActiveRecord::Migration[6.1]
  def change
    change_column_null :answers, :body, false
    change_column_null :answers, :question_id, false
    change_column_null :questions, :body, false
    change_column_null :questions, :test_id, false
    change_column_null :questions, :answer_id, false
    change_column_null :tests, :level, false
    change_column_null :users, :username, false
  end
end
