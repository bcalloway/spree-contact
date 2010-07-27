class RenameStateForeignKey < ActiveRecord::Migration
  def self.up
    rename_column :contacts, :us_state, :state_id
  end

  def self.down
    rename_column :contacts, :state_id, :us_state
  end
end