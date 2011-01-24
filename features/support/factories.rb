Factory.sequence :author_name do |n|
  "Author #{n}"
end

Factory.sequence :book_name do |n|
  "Book #{n}"
end

Factory.define :book do |book|
  book.name    { Factory.next(:book_name)   }
  book.authors { Factory.next(:author_name) }
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
end

Factory.sequence :user_uid do |n|
  "uid#{n.to_s}"
end

