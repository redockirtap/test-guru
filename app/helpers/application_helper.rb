module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to("TestGuru", "https://github.com/#{author}/#{repo}", target: :_blank)
  end

  def human_name(model)
    model.model_name.human
  end

  def bool_name(bool)
    if bool
      I18n.t('.bools.true')
    else
      I18n.t('.bools.false')
    end
  end
end
