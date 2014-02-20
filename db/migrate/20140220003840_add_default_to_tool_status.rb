class AddDefaultToToolStatus < ActiveRecord::Migration
  def change
    change_column :tools, :status, :string, default: 'available'
  end
end
