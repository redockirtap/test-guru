class AddCorrectAttributeToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :correct, :boolean
    change_column_default(:answers, :correct, from: nil, to: false)
  end
end
