class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { greater_than: -1, only_integer: true }

  scope :easy, -> { where(level: 0) }
  scope :advanced, -> { where(level: 1) }
  scope :hard, -> { where(level: 2) }
  scope :hero, -> { where(level: 3) }

  scope :category, ->(title) { joins(:category).where(category: { title: }) }

  def self.sort_by_category(title)
    category(title).order(title: :desc).pluck(:title)
  end
end
