class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  # A User can only have one reservation for each book
  validates_uniqueness_of :book_id, :scope => :user_id,
                          :message => "already has a reservation for you"
  validates_presence_of   :book, :user
end
