class Book < ActiveRecord::Base
  validates :name, :presence => true
  validates :authors, :presence => true

  has_many :votes

  def vote_up(user)
    vote = Vote.new(:direction => Vote::UP, :book => self, :user => user)
    vote.save!
  end
end
