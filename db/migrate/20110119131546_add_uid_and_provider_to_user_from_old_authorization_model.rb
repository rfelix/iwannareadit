class AddUidAndProviderToUserFromOldAuthorizationModel < ActiveRecord::Migration
  def self.up
    drop_table :authorizations if table_exists? :authorizations
    add_column :users, :uid,      :string
    add_column :users, :provider, :string
  end

  def self.down
    remove_column :users, :uid
    remove_column :users, :provider
  end
end
