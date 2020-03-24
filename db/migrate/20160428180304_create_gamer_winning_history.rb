class CreateGamerWinningHistory < ActiveRecord::Migration
  def change
    create_table :gamer_winning_histories do |t|
      t.references :gamer, index: true
      t.references :winning_rule, index: true
      t.references :gaming_vendor, index: true # For caching
      t.references :coupon, index: true # For caching
      t.boolean :used, default: false
      t.timestamps
    end
  end
end
