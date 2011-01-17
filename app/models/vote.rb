class Vote < ActiveRecord::Base
  UP   =  1
  DOWN = -1
  NULL =  0

  belongs_to :user
  belongs_to :book

  # A User can only have one vote for each book
  validates_uniqueness_of :book_id, :scope => :user_id

  scope :up,   where(:direction => UP)
  scope :down, where(:direction => DOWN)

  scope :by_book, lambda { |book| where(:book_id => book.id) }
  scope :by_user, lambda { |user| where(:user_id => user.id) }

  def self.count_for(book)
    book_votes = Vote.by_book(book)
    book_votes.up.count - book_votes.down.count
  end

  def self.for(user, book)
    vote = by_user(user).by_book(book)
    if vote.count == 0
      Vote.new :user => user, :book => book, :direction => 0
    else
      vote.first
    end
  end

  def up
    return false if direction == UP
    self.direction += 1
    self.save
  end

  def down
    return false if direction == DOWN
    self.direction += -1
    self.save
  end
end
