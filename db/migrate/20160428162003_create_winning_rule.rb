class CreateWinningRule < ActiveRecord::Migration
  def change
    create_table :winning_rules do |t|
      t.references :gaming_vendor, index: true
      t.references :coupon, index: true
      t.string :type # For identifying different criterias
      t.string :name
      t.text :description, limit: 1500
      t.boolean :active, default: true

      # Criterias
      t.integer :level
      t.integer :points # OR score
      t.integer :max_rating
      t.integer :given_rating
      t.integer :times_played
      t.datetime :played_from
      t.datetime :played_last
      t.integer :play_duration # In seconds
      t.decimal :percentage
      t.string :trophy
      t.string :realm
      # Criterias END

      t.timestamps
    end
  end
end
