class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :image
      t.string :name
      t.text :description
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
