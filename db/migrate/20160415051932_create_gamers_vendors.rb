class CreateGamersVendors < ActiveRecord::Migration
  def change
    create_table :gamers_vendors do |t|
      t.references :gamer,  index: true
      t.references :vendor, index: true
      t.timestamps
    end
  end
end
