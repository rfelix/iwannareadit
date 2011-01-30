class Book < ActiveRecord::Base
  has_many :votes
  has_many :comments, :order => "comments.created_at desc"
  has_many :reservations, :order => "reservations.created_at asc"
  has_and_belongs_to_many :authors

  accepts_nested_attributes_for :authors

  validates :name, :presence => true
  validates_presence_of :authors

  scope :not_bought, where(:is_bought => false)
  scope :bought, where(:is_bought => true)
end
