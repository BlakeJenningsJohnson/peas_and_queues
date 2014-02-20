class ChangeAvailableToStatus < ActiveRecord::Migration
  def change
    remove_column :tools, :available
    add_column :tools, :status, :string
  end
end
