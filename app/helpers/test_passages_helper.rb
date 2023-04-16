module TestPassagesHelper
  def score_count(resource)
    total = ((resource.correct_questions / resource.test.questions.count.to_f) * 100).round

    if total <= 65
      "<p class=\"test--failed\">You scored #{total}%. Test should be retaken.</p>".html_safe
    else
      "<p class=\"test--failed\">You scored #{total}%. Test is passed successfully!</p>".html_safe
    end
  end

  def questions_count(resource)
    "#{current_question_number(resource)}/#{@test_passage.test.questions.count}"
  end

  def current_question_number(resource)
    resource.test.question_ids.find_index(resource.current_question.id) + 1 unless resource.test.question_ids.empty?
  end
end
