class Book < ActiveRecord::Base
  has_many :votes
  has_many :comments, :order => "comments.created_at desc"
  has_many :reservations, :order => "reservations.created_at asc", :conditions => ["reservations.status != ?", Reservation::CHECKED_IN]
  has_and_belongs_to_many :authors

  accepts_nested_attributes_for :authors

  validates :name, :presence => true
  validates_presence_of :authors

  scope :not_bought, where(:is_bought => false)
  scope :bought, where(:is_bought => true)

  def reserved_by?(user)
    !!reservations.find_by_user_id(user)
  end

  def can_be_checked_out_by?(user)
    reservations.first && reservations.first.user == user
  end

  def is_checked_out?
    reservations.first && reservations.first.is_checked_out?
  end

  def is_checked_out_by?(user)
    is_checked_out? && reservations.first.user == user
  end
end
