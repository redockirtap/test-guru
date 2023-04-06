class User < ApplicationRecord

  def level_tests(level)
    test_ids = Result.joins(:test, :user).where({ test: { level: }, user_id: id }).pluck(:test_id)
    Test.find(test_ids)
  end
end
