class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :provider
      t.string :email
      t.string :phone
      t.boolean :admin, default: false
      t.string :avatar
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end
