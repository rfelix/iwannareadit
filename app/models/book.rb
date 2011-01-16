class Book < ActiveRecord::Base
  validates :name, :presence => true
  validates :authors, :presence => true
end
