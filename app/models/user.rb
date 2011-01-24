class User < ActiveRecord::Base
  has_many :votes
  has_many :comments

  validates_presence_of   :provider
  validates_uniqueness_of :uid

  def self.find_from_auth_hash(hash)
    find_by_provider_and_uid hash['provider'], hash['uid']
  end

  def self.create_from_auth_hash(hash)
    create :name     => hash['user_info']['name'],
           :email    => hash['user_info']['email'],
           :uid      => hash['uid'],
           :provider => hash['provider']
  end
end
