class CouponVendor::BaseController < ApplicationController
  layout 'admin'
  helper_method :environment_subdomain?, :live_environment?, :test_environment?
  before_action :authenticate_vendor!
  before_action :authorize_section!
  before_action :set_default_environment!, if: -> { session[:crud_environment].blank? }
  before_action :switch_environment!, unless: -> { environment_subdomain? }

  private
    def authorize_section!
      if !current_vendor.is_a?(CouponVendor)# || !current_vendor.is_a?(Admin)
        redirect_to root_path, alert: 'You dont have access to this section'
      end
    end

    def set_default_environment!
      session[:crud_environment] ||= :test
      @test_environment = (session[:crud_environment] == :test)
    end

    def switch_environment!
      Apartment::Tenant.switch!(session[:crud_environment])
    end

    def environment_subdomain?
      request.subdomain.present? && ['test', 'live'].include?(request.subdomain.to_s)
    end

    def live_environment?
      request.subdomain.to_s == 'live' || (!environment_subdomain? && !@test_environment)
    end

    def test_environment?
      request.subdomain.to_s == 'test' || (!environment_subdomain? && @test_environment)
    end
end
