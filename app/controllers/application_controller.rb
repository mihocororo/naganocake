class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_up_path_for(resource)
    case resource
    when Admin
      admins_root_path
    when Public
      root_path
    end
  end

end
