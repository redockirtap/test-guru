class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.integer :test_id, null: false
      t.timestamps
    end
  end
end
