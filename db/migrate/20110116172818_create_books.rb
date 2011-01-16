class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :name
      t.string :authors

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
