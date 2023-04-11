module QuestionsHelper
  def question_header(resource)
    if resource.new_record?
      "Create new question for #{resource.test.title}"
    else
      "Edit question for #{resource.test.title}"
    end
  end
end
