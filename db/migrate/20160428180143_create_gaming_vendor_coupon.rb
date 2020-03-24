class CreateGamingVendorCoupon < ActiveRecord::Migration
  def change
    create_table :gaming_vendor_coupons do |t|
      t.references :gaming_vendor, index: true
      t.references :coupon, index: true
      t.integer :quantity
      t.timestamps
    end
  end
end
