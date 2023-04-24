class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true, dependent: :destroy

  before_validation :before_validation_set_current_question, on: :create
  before_update :before_update_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def progress
    return 100 if completed?

    (current_question_number - 1) * 100 / all_test_questions.count
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort unless answer_ids.nil?
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_set_current_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def current_question_number
    all_test_questions.pluck(:id).find_index(current_question.id) + 1 unless completed?
  end

  def all_test_questions
    current_question.test.questions
  end
end
