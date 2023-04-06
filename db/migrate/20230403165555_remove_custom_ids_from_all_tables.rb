class RemoveCustomIdsFromAllTables < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :question_id, :integer
    remove_column :categories, :test_id, :integer
    remove_column :questions, :test_id, :integer
    remove_column :questions, :answer_id, :integer
    remove_column :tests, :category_id, :integer
  end
end
