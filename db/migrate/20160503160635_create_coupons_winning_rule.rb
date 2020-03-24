class CreateCouponsWinningRule < ActiveRecord::Migration
  def change
    create_table :coupons_winning_rules do |t|
      t.references :winning_rule, index: true
      t.references :coupon, index: true
      t.timestamps
    end
  end
end
