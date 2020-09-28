class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   user_path(resource.id)
  # end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'toshi' && password == '1048'
    end
  end

end
