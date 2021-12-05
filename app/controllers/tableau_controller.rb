class TableauController < ApplicationController
    before_action :authenticate_assistant!,only: [:assistant]
    before_action :authenticate_user!,only: [:user]
    

    def assistant
       @discussions=Discussion.all
       @my_discussions=Discussion.where(assistant_id:current_assistant.id).all
    end

    def user
        @discussions=Discussion.where(user_id:current_user.id).all
     end

end
