module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to("TestGuru", "https://github.com/#{author}/#{repo}", target: :_blank)
  end

  def flash_messages(flash)
    flash.each_with_object('') do |(key, value), result|
      result << content_tag(:p, value, class: "flash #{key}")
    end.html_safe
  end
end
