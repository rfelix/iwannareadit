class Book < ActiveRecord::Base
  has_many :votes
  has_many :comments

  validates :name, :presence => true
  validates :authors, :presence => true

  alias_method :_original_comments, :comments
  def comments
    _original_comments.reverse
  end
end
