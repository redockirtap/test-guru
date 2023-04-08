class ChangeNullableColumns < ActiveRecord::Migration[6.1]
  def change
    change_column_null :answers, :question_id, false
    change_column_null :questions, :test_id, false
    change_column_null :tests, :category_id, false
  end
end
