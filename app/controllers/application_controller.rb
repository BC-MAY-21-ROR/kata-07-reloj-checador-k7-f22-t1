# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :danger

  before_action :configure_devise_params, if: :devise_controller?

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |admin|
      admin.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
