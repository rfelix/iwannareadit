class Reservation < ActiveRecord::Base
  PENDING     = 0
  CHECKED_OUT = 1
  CHECKED_IN  = 2

  belongs_to :user
  belongs_to :book

  # A User can only have one reservation for each book
  validates_uniqueness_of   :book_id, :scope => :user_id,
                            :message => "already has a reservation for you"
  validates_presence_of     :book, :user
  validates_numericality_of :status, :only_integer => true
  validates_inclusion_of    :status, :in => [0,1,2], :message => "is in unknown state"

  # This assumes that Reservations can only be updated when their status changes
  validate :can_be_checked_out, :correct_user, :if => :is_checked_out?, :on => :update
  validate :can_be_checked_in,                 :if => :is_checked_in?,  :on => :update

  after_save :remove_reservation_after_check_in

  def self.for(args)
    raise ArgumentError, "Hash args needs :user and :book keys" unless [:user, :book].all? { |k| args.include?(k) }
    where("user_id = ? and book_id = ?", args[:user], args[:book]).first
  end

  def self.in_front_count_for(args)
    raise ArgumentError, "Hash args needs :user and :book keys" unless [:user, :book].all? { |k| args.include?(k) }
    count = 0
    args[:book].reservations.each do |reservation|
      break if reservation.user == args[:user]
      count += 1
    end
    count
  end

  def check_out
    self.status = CHECKED_OUT
  end

  def check_in
    self.status = CHECKED_IN
  end

  def is_checked_out?
    self.status == CHECKED_OUT
  end

  def is_checked_in?
    self.status == CHECKED_IN
  end


  private

  def can_be_checked_out
    return unless self.book.is_checked_out?
    errors.add(:status, " can't change, book has already been checked out")
  end

  def correct_user
    return if self.book.can_be_checked_out_by?(self.user)
    errors.add(:status, " can't change, it's not your turn to check out book")
  end

  def can_be_checked_in
    return if self.book.is_checked_out_by?(self.user)
    errors.add(:status, " can't change, book is not checked out by you")
  end

  def remove_reservation_after_check_in
    return unless status == CHECKED_IN
    self.destroy
  end

end
