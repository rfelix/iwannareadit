class Vote < ActiveRecord::Base
  UP   =  1
  DOWN = -1

  belongs_to :user
  belongs_to :book

  # A User can only have one vote for each book
  validates_uniqueness_of :book_id, :scope => :user_id

  scope :up,   where(:direction => UP)
  scope :down, where(:direction => DOWN)

  scope :by_book, lambda { |book| where(:book_id => book.id) }
  scope :by_user, lambda { |user| where(:user_id => user.id) }

end
