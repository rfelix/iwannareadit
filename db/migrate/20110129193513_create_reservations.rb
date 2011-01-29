class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reservations
  end
end
