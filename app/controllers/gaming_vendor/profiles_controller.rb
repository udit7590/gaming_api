class GamingVendor::ProfilesController < GamingVendor::BaseController
  def show
  end

  def update
    if current_vendor.update(profile_params)
      redirect_to gaming_vendor_account_path, notice: 'Your profile has been updated.'
    else
      render :show
    end
  end

  private
    def profile_params
      params.require(:gaming_vendor).permit(:email, :company_name, :game_name, :phone)
    end
end
