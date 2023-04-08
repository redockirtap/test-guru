class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id

  def filter_tests_by_level(level)
    test_ids = UserTest.joins(:test).where({ test: { level: }, user_id: id }).pluck(:test_id)
    Test.find(test_ids)
  end
end
