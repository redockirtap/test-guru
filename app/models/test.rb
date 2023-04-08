class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests

  def self.sort_by_category(category_name)
    category_id = Category.find_by(title: category_name).id
    Test.where(category_id:).order(title: :desc).pluck(:title)
  end
end
