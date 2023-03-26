class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :body
      t.integer :test_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
