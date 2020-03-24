module ApiMessages
  extend ActiveSupport::Concern

  private
    def rendor_api_error_message(errors_or_message, code=400)
      rendor json: { success: false, error: errors_or_message }, status: code
    end

    def rendor_api_success_message(message, info=nil, code=200)
      rendor json: { success: true, message: message, object: info }, status: code
    end
end
