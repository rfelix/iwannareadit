class User < ActiveRecord::Base
  has_one :authorization

  def self.create_from_hash(hash)
    create :name => hash['user_info']['name'],
           :email => hash['user_info']['email']
  end
end
