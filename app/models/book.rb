class Book < ActiveRecord::Base
  has_many :votes
  has_many :comments, :order => "comments.created_at desc"

  validates :name, :presence => true
  validates :authors, :presence => true

  scope :not_bought, where(:is_bought => false)
  scope :bought, where(:is_bought => true)
end
