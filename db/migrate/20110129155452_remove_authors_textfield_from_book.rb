class RemoveAuthorsTextfieldFromBook < ActiveRecord::Migration
  def self.up
    remove_column :books, :authors
  end

  def self.down
    add_column :books, :authors, :string
  end
end
