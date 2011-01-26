class Book < ActiveRecord::Base
  has_many :votes
  has_many :comments

  validates :name, :presence => true
  validates :authors, :presence => true

  scope :not_bought, where(:is_bought => false)
  scope :bought, where(:is_bought => true)

  alias_method :_original_comments, :comments
  def comments
    _original_comments.reverse
  end
end
