class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  # TODO: Write spec for this first
  # A User can only have one vote for each book
  #validates_uniqueness_of :vote_id, :scope => [:book_id, :user_id]

  UP   =  1
  DOWN = -1

  scope :up, where(:direction => UP)

end
