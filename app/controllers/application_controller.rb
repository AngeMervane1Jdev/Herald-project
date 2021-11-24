class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_devise_parameters ,if: :devise_controller?

    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:account_update){ |u| u.permit(:surname,:birthday,:lieu,:address,:name,:current_password,:tel,:email,:password,:password_confirmation,:position)}
        devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:name,:surname,:email,:birthday,:password,:password_confirmation,:position,:tel,:lieu,:address)}
    end
    include PmeHelper
end
