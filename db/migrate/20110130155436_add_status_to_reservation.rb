class AddStatusToReservation < ActiveRecord::Migration
  def self.up
    add_column :reservations, :status, :integer, :default => 0
  end

  def self.down
    remove_column :reservations, :status
  end
end
