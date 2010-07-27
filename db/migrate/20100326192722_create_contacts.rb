class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string    :name
      t.string    :email
      t.string    :us_state
      t.string    :zip
      t.text      :message
      t.integer   :optin
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end