class Book < ActiveRecord::Base
  has_many :votes
  has_many :comments

  validates :name, :presence => true
  validates :authors, :presence => true
end
