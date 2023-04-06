# Create 5 categories
5.times do |i|
  Category.create(title: "Category #{i+1}")
end

# Create 5 questions
5.times do |i|
  Question.create(body: "Question #{i+1}")
end

# Create 5 answers
5.times do |i|
  Answer.create(body: "Answer #{i+1}", correct: [true, false].sample)
end

# Create 5 tests
5.times do |i|
  Test.create(title: "Test #{i+1}", level: rand(0..5))
end

# Create 5 users
5.times do |i|
  User.create(username: "user#{i+1}")
end

# Create 5 results
test_ids = Test.pluck(:id)
user_ids = User.pluck(:id)

5.times do
  Result.create(
    test_id: test_ids.sample,
    user_id: user_ids.sample
  )
end
