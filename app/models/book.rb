class Book < ActiveRecord::Base
  validates :name, :presence => true
  validates :authors, :presence => true

  has_many :votes

  def vote_up(user)
    votes = Vote.by_user(user).by_book(self)
    if votes.count == 0
      Vote.new(:direction => Vote::UP, :book => self, :user => user).save
    elsif votes.first.direction != Vote::UP
      votes.first.destroy
      true
    end
  end

  def vote_down(user)
    votes = Vote.by_user(user).by_book(self)
    if votes.count == 0
      Vote.new(:direction => Vote::DOWN, :book => self, :user => user).save
    elsif votes.first.direction != Vote::DOWN
      votes.first.destroy
      true
    end
  end
end
