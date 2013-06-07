class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :define_resource_params, if: :devise_controller?
  
  protected
  def define_resource_params
    if ((self.class <= Devise::PasswordsController) || (self.class <= Devise::RegistrationsController))
      self.class.send(:define_method, :resource_params) do
        params.require(resource_name).permit(:email, :password, :password_confirmation)
      end
    end
  end
  
end
