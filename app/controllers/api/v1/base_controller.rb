module Api
  module V1
    class BaseController < ApplicationController
      include ApiMessages

      helper_method :current_api_vendor

      before_action :authorize_request
      before_action :check_valid_vendor
      before_action :switch_environment!

      rescue_from ActiveRecord::RecordNotFound do |exception|
        respond_to do |format|
          format.json do
            rendor_api_error_message('Resource not found', 404)
          end
        end
      end
      
      protected

        # HEADERS =>
        # Authorization: Basic <api_key>
        # REQUEST =>
        # {
        #   test: true
        # }
        def authorize_request
          auth_header = request.headers['Authorization'].to_s
          referer     = request.headers['Referer'].to_s
          auth_type, auth_token = auth_header.split(' ')
          @vendor     = Vendor.find_by_api_key(auth_token, params[:test], referer)

          if !(auth_type == 'Basic' && @vendor.blank?)
            rendor_api_error_message('Invalid api key', 401)
          end
        end

        def check_valid_vendor
          if current_api_vendor.try(:type) != 'GamingVendor'
            rendor_api_error_message('Invalid vendor', 401)
          end
        end

        def switch_environment!
          if live_environment?
            Apartment::Tenant.switch!('live')
          else
            Apartment::Tenant.switch!('test')
          end
        end

        def environment_subdomain?
          # TODO: Check for heroku
          request.subdomain.present? && ['test', 'live'].include?(request.subdomain.to_s)
        end

        def live_environment?
          request.subdomain.to_s == 'live' || (!environment_subdomain? && !params[:test])
        end

        def test_environment?
          request.subdomain.to_s == 'test' || (!environment_subdomain? && params[:test])
        end

        def current_api_vendor
          @vendor
        end
    end
  end
end
