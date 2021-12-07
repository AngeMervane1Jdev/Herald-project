class HomeController < ApplicationController
    def index
       if current_user.present? and current_user.pme ==nil
        flash[:alert] = "Veuillez enrégistrer votre Société avant de continuer"
        return redirect_to new_pme_path
       end
    end
end
