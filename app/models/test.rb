class Test < ApplicationRecord
  has_one :result

  def self.sort_by_category(category_name)
    category_id = Category.find_by(title: category_name).id
    Test.where(category_id:).order(title: :desc).pluck(:title)
  end
end
