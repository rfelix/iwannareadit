class User < ActiveRecord::Base
  has_many :votes
  has_many :comments
  has_many :reservations, :order => "reservations.created_at asc", :conditions => ["reservations.status != ?", Reservation::CHECKED_IN]

  validates_presence_of   :provider
  validates_uniqueness_of :uid

  scope :admin,  where(:is_admin => true)
  scope :normal, where(:is_admin => false)

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
