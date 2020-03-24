class GamingVendor::ApisController < GamingVendor::BaseController
  def show
  end

  def update
    if current_vendor.regenerate_key(params[:keys])
      redirect_to gaming_vendor_api_path, notice: 'Your key(s) have been successfully refreshed.'
    else
      redirect_to gaming_vendor_api_path, alert: 'Unable to refresh your key(s)'
    end
  end

end
