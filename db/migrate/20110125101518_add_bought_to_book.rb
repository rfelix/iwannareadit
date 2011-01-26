class AddBoughtToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :is_bought, :boolean, :default => false
  end

  def self.down
    remove_column :books, :is_bought
  end
end
