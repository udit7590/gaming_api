# 1. Can create coupons and their count
# 2. TODO: Can reach out for support
# 3. Can change profile info
# 4. Can view account info (Email, status, last login, last updated)
# 5. TODO: Usage stats (Who is using the coupon. How many granted, etc)
class CouponVendor < Vendor
  # We need to be careful with deleting coupons. They may still be in use
  has_many :coupons, dependent: :restrict_with_error
end
