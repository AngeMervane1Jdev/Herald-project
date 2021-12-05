class CommentairesController < ApplicationController
  


  def create
   
    @discussion = Discussion.find(params[:discussion_id])
    @commentaire = @discussion.commentaires.build(commentaire_params)
    if current_assistant.present? and @discussion.assistant_id==nil
      @discussion.update(assistant_id:current_assistant.id,titre:"#{@discussion.titre}-#{current_assistant.nom}")
    end
    if current_user.present?
      @commentaire.send_by="user"
    else
        @commentaire.send_by="assistant"
    end

    respond_to do |format|
      if @commentaire.save!
       
        format.html {redirect_to discussion_path(@discussion),notice: 'Message envoyé'}
      else
        format.html { redirect_to discussion_path(@discussion), notice: "Le message n'a pas été envoyé" }
      end
    end

  end



  def destroy
    @commentaire = Commentaire.find(params[:id])
    @discussion=@commentaire.discussion
    if @commentaire.destroy
      flash[:notice] = "Vous avez suprimé un message"
    end
    redirect_to discussion_path(@discussion)
  end

  private

  def commentaire_params
    params.require(:commentaire).permit(:discussion_id, :message)
  end
end