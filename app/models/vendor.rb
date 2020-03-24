# Solution for test and live environment
# => Maintain 3 schemas: test, live and public
# => public for Vendor as this does not need to be environment specific.
# => test,live for all business tables.
# --------------------------- @properties ---------------------------
# t.string :email,              null: false, default: ""
# t.string :encrypted_password, null: false, default: ""
# t.string :game_name
# t.string :company_name
# t.string :test_api_normal_key
# t.string :test_api_privileged_key
# t.string :live_api_normal_key
# t.string :live_api_privileged_key
# t.string :phone
# t.string :type # GamingVendor, CouponVendor, Admin
# t.boolean :active
# t.timestamps null: false
# --------------------------- ########### ---------------------------
class Vendor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , , :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  def game_developer?
    type.to_s == 'GamingVendor'
  end

  def coupon_provider?
    type.to_s == 'CouponVendor'
  end

  def admin?
    type.to_s == 'Admin'
  end

  def status
    confirmed? ? (locked_at? ? 'Locked' : 'Verified') : 'Unverified'
  end

  def humanized_type
    case type
    when 'Admin' then 'Admin'
    when 'GamingVendor' then 'API consumer'
    when 'CouponVendor' then 'Coupon Provider'
    end
  end

  def self.find_by_api_key(key, referrer=nil, test=true)
    if test
      vendor = where(test_api_normal_key: key).first
    else
      vendor = where(live_api_normal_key: key).first
    end
    vendor
  end
end
