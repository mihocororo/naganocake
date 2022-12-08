class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number])
  end


  def after_sign_up_path_for(resource)
    case resource
    when Admin
      admins_root_path
    when Public
      root_path
    end
  end

end
