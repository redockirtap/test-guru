# Create 5 categories
5.times do |i|
  Category.create(title: "Category #{i+1}")
end

# Create 5 tests
category_ids = Category.pluck(:id)

5.times do |i|
  Test.create(title: "Test #{i+1}", level: rand(0..5), category_id: category_ids.sample)
end

# Create 5 questions
test_ids = Test.pluck(:id)

5.times do |i|
  Question.create(body: "Question #{i+1}", test_id: test_ids.sample)
end

# Create 5 answers
question_ids = Question.pluck(:id)

5.times do |i|
  Answer.create(body: "Answer #{i+1}", correct: [true, false].sample, question_id: question_ids.sample)
end

# Create 5 users
5.times do |i|
  User.create(username: "user#{i+1}")
end

# Create 5 user tests
user_ids = User.pluck(:id)

5.times do
  UserTest.create(
    test_id: test_ids.sample,
    user_id: user_ids.sample
  )
end
