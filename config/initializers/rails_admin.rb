RailsAdmin.config do |config|

  config.authorize_with do |controller|
    if current_administrateur==nil 
      redirect_to main_app.new_administrateur_session_path, flash: {error: "Veuillez vous connectez"}
     end
  end
  ### Popular gems integration

  ## == Devise ==
  #  config.authenticate_with do
  #    warden.authenticate! scope: :administrateur
  #  end
  #  config.current_user_method(&:current_administrateur)

  ## == CancanCan ==
   #config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                # mandatory
    index                       # mandatory
    new
    export
    bulk_delete 
    show
    edit
    delete
      
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
