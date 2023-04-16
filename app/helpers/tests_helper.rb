module TestsHelper
  TEST_LEVELS = { 0 => :elementary, 1 => :advanced, 2 => :hard }.freeze

  def test_level(test)
    level = TEST_LEVELS[test.level] || :hero
    I18n.t(".tests.test.test_level.#{level}")
  end
end
