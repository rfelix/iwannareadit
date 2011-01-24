class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates_presence_of :body, :user, :book
end
