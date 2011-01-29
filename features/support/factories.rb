Factory.define :author do |author|
  author.first_name  "James"
  author.middle_name { Factory.next(:author_middle_name) }
  author.last_name   "Doe"
end

Factory.sequence :author_middle_name do |n|
  "The #{n}"
end

Factory.sequence :book_name do |n|
  "Book #{n}"
end

Factory.define :book do |book|
  book.name { Factory.next(:book_name)   }
  book.association :authors
end

Factory.define :comment do |comment|
  comment.body 'This is a comment.'
  comment.association :book
  comment.association :user
end

Factory.define :user do |user|
  user.name     'John Doe'
  user.email    'email@example.com'
  user.provider 'google_apps'
  user.uid      { Factory.next(:user_uid) }
  user.is_admin false
end

Factory.sequence :user_uid do |n|
  "uid#{n.to_s}"
end

