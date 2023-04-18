module TestsHelper
  TEST_LEVELS = { Elementary: 0, Advanced: 1, Hard: 2, Hero: 3 }.freeze

  def test_level(test)
    level = test.level
    I18n.t(".tests.test.test_level.#{level}")
  end

  def levels
    TEST_LEVELS
  end
end
