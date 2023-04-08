class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id

  def filter_tests_by_level(level)
    tests.where(level:)
  end
end
