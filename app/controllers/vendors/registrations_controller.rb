class Vendors::RegistrationsController < Devise::RegistrationsController
  COUPON_PROVIDER_SUBMIT = "I'm Coupon Provider"
  API_CONSUMER_SUBMIT    = "I'm API Consumer"

  layout 'admin'
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :company_name
    devise_parameter_sanitizer.for(:sign_up) << :phone
  end

  def sign_up_params
    super.merge(type_param)
  end

  def type_param
    { type: (params[:commit] == COUPON_PROVIDER_SUBMIT) ? 'CouponVendor' : 'GamingVendor' }
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    root_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    new_vendor_confirmation_path
  end
end
