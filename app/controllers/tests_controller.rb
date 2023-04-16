class TestsController < ApplicationController

  before_action :authenticate_user!, except: :index
  before_action :find_test, only: [:show, :edit, :update, :destroy, :start]

  def index
    @tests = Test.all
  end

  def start
    return if @test.questions.empty?

    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
