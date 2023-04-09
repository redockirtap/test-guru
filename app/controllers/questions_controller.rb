class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, only: [:destroy, :show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions

    render json: @questions
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def create
    question = Question.create(question_params)
    question.update(test_id: params[:test_id])

    if question.persisted?
      render json: { new: question, params: question_params }
    else
      render json: question.errors.full_messages
    end
  end

  def destroy
    @question.destroy

    redirect_to test_questions_path
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
