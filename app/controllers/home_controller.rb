class HomeController < ApplicationController
    def home
       if current_user.present? and current_user.pme ==nil
        flash[:notice] = "Veuillez enrégistrer votre Société avant de continuer"
        return redirect_to new_pme_path
       end

    end
end
