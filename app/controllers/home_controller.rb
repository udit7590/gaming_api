class HomeController < ApplicationController
  def index
    if current_vendor.present?
      case current_vendor.type
      when 'GamingVendor' then redirect_to gaming_vendor_account_path
      when 'CouponVendor' then redirect_to coupon_vendor_account_path
      end
    else
      redirect_to new_vendor_session_path
    end
  end
end
