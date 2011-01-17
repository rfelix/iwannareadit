class Book < ActiveRecord::Base
  validates :name, :presence => true
  validates :authors, :presence => true

  has_many :votes

  def vote_up(user)
    Vote.create(:direction => Vote::UP, :book => self, :user => user).persisted?
  end
end
