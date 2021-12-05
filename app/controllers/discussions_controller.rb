class DiscussionsController < ApplicationController
  before_action :set_discussion, only: %i[edit update destroy ]
  before_action :is_connected
  before_action :authenticate_administrateur!,only: :update
  before_action :has_discusion, only: :create
  # GET /discusses or /discusses.json
  def index
    @discussions = Discussion.all
  end

  # GET /discusses/1 or /discusses/1.json
  def show
    @discussion=Discussion.find params[:id].to_i
    @commentaires = @discussion.commentaires
    @commentaire= @discussion.commentaires.build
  end

  # GET /discusses/new
  def new
    @discussion = Discussion.new
  end

  # GET /discusses/1/edit
  def edit
  end

  # POST /discusses or /discusses.json
  def create

    @discussion = Discussion.new
    @discussion.category=params[:type]
    @discussion.user_id=current_user.id
    @discussion.titre=current_user.name

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: "Discussion was successfully created." }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discusses/1 or /discusses/1.json
  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: "Discuss was successfully updated." }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discusses/1 or /discusses/1.json
  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url, notice: "Discuss was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def has_discusion
        if current_user.discussions.count>0
            if params[:category]=="juridique"
              if current_user.discussions.last.category=="juridique"
                
                return redirect_to discussion_path(current_user.discussions.last.id)
              elsif current_user.discussions.first.category=="juridique"
                
                return redirect_to discussion_path(current_user.discussions.first.id)  
              end
            else 
              if current_user.discussions.last.category=="fiscale"
                return redirect_to discussion_path(current_user.discussions.last.id)
              elsif current_user.discussions.first.category=="fiscale"
                
                return redirect_to discussion_path(current_user.discussions.first.id)  
              end
            end      

        end
      end


      private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    
    

    # Only allow a list of trusted parameters through.
    def discussion_params
      params.require(:discussion).permit(:category)
    end

    def is_connected
      unless current_user.present? or current_assistant.present?
       redirect_to new_user_registration_path 
      end
    end
end
