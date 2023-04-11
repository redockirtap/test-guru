class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, only: [:destroy, :show, :edit, :update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions

    render json: @questions
  end

  def show
  end

  def new
    @question = @test.questions.new
  end

  def edit
  end

  def create
    @question = @test.questions.create(question_params)

    if @question.persisted?
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to test_path(@question.test)
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
