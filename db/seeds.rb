30.times do |n|
  email  = "user#{n+1}@demo.com"
  password = "123qwe"
  User.create! email: email, password: password, password_confirmation: password
end

# users = User.all
# user  = users.first
# following = users[2..20]
# followers = users[3..20]
# following.each {|followed| user.follow(followed)}
# followers.each {|follower| follower.follow(user)}

# create categories
20.times do |n|
  name = "cate #{n+1}"
  desc = "mo ta ve #{name}"
  Category.create! Name: name, Description: desc
end

# create books
20.times do |n|
  title = "book#{n+1}"
  desc = "Mo ta #{title}"
  author = Faker::Name.name
  publisher = Faker::University.name
  cate_id = 1 + rand(15)
  Book.create! Title: title, Description: desc, Page_number: 99, Author: author,
    Publisher: publisher, category_id: cate_id
end

# create request
20.times do |n|
  user_id = 1 + rand(19)
  book_id = 1 + rand(19)
  Request.create! User_Id: user_id, Book_Id: book_id, Deadline: Time.now
end
