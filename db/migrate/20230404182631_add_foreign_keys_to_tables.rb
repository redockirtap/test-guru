class AddForeignKeysToTables < ActiveRecord::Migration[6.1]
  def change
    add_reference(:tests, :category, foreign_key: true)
    add_reference(:questions, :test, foreign_key: true)
    add_reference(:answers, :question, foreign_key: true)
  end
end
