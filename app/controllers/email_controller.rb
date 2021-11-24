class EmailController < ApplicationController
    skip_before_action :verify_authenticity_token 
    def email_checker
        @user = User.search(params[:email])
        respond_to do |format|
          format.json {render :json => {email_exists: @user.present?}} 
        end
      end
end
