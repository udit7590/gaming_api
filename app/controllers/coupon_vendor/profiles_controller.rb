class CouponVendor::ProfilesController < CouponVendor::BaseController
  def show
  end

  def update
    if current_vendor.update(profile_params)
      redirect_to coupon_vendor_account_path, notice: 'Your profile has been updated.'
    else
      render :show
    end
  end

  private
    def profile_params
      params.require(:coupon_vendor).permit(:email, :company_name, :phone)
    end
end
