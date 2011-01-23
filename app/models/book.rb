class Book < ActiveRecord::Base
  has_many :votes
  validates :name, :presence => true
  validates :authors, :presence => true
end
