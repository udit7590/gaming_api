class Vendors::EnvironmentsController < ApplicationController
  before_action :authenticate_vendor!

  def update
    if params[:environment].to_sym == :live
      session[:crud_environment] = :live
      @test_environment = false
    else
      session[:crud_environment] = :test
      @test_environment = true
    end
    redirect_to (request.referrer.presence || root_path), notice: "Switched to #{ session[:crud_environment] } environment"
  end
end
