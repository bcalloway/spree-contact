class AddMissingColumns < ActiveRecord::Migration
  def self.up
    add_column :contacts, :city, :string
  end

  def self.down
    remove_column :contacts, :city
  end
end