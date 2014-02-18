class CreateWaitlists < ActiveRecord::Migration
  def change
    create_table :waitlists do |t|
      t.integer :user_id
      t.integer :tool_id

      t.timestamps
    end
  end
end
