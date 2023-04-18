class GistsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[create]

  def create
    service = GistQuestionService.new(@test_passage.current_question)
    gist_url = service.call.html_url

    if service.success?
      current_user.gists.create(question: @test_passage.current_question, url: gist_url)
      flash[:notice] = t('test_passages.form.gist.success_html', url: gist_url)
    else
      flash[:alert] = t('test_passages.form.gist.failure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
