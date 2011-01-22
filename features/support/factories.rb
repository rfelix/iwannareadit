Factory.sequence :user_uid do |n|
  "uid#{n.to_s}"
end

Factory.define :user, :class => User do |user|
  user.name     'John Doe'
  user.email    'email@example.com'
  user.provider 'google_apps'
  user.uid      Factory.next(:user_uid)
end

Factory.sequence :book_name do |n|
  "Book #{n}"
end

Factory.sequence :author_name do |n|
  "Author #{n}"
end

Factory.define :book do |book|
  book.name    Factory.next(:book_name)
  book.authors Factory.next(:author_name)
end
