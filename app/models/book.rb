class Book < ActiveRecord::Base
  validates :name, :presence => true
  validates :authors, :presence => true

  has_many :votes
end
