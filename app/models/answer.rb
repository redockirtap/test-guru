class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answers_limit

  scope :correct, -> { where(correct: true) }

  private

  def answers_limit
    errors.add(:answers_limit, 'is 1 to 4 for each question') if question.answers.count >= 4
  end
end
