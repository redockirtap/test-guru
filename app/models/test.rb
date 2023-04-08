class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { greater_than: -1, only_integer: true }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..7) }

  scope :category, ->(title) { joins(:category).where(category: { title: }) }

  def self.sort_by_category(title)
    category(title).order(title: :desc).pluck(:title)
  end
end
