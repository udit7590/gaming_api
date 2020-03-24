class CreateGamerDevice < ActiveRecord::Migration
  def change
    create_table :gamer_devices do |t|
      t.references :gamer, index: true
      t.string :token
      t.string :primary_email
      t.string :model
      t.string :phone
      t.timestamps
    end
  end
end
