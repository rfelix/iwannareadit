class Vote < ActiveRecord::Base
  UP   =  1
  DOWN = -1
  NULL =  0

  belongs_to :user
  belongs_to :book

  # A User can only have one vote for each book
  validates_uniqueness_of :book_id, :scope => :user_id

  validates_numericality_of :direction, :only_integer => true
  validates_numericality_of :direction,
                            :less_than_or_equal_to => 1,
                            :message               => "You've already up voted this Book"

  validates_numericality_of :direction,
                            :greater_than_or_equal_to => -1,
                            :message                  => "You've already down voted this Book"

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
    self.direction += 1
  end

  def down
    self.direction += -1
  end

  def can_increase?
    !self.book.is_bought? && self.direction < UP
  end

  def can_decrease?
    !self.book.is_bought? && self.direction > DOWN
  end
end
