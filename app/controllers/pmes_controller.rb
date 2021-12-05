class PmesController < ApplicationController
  before_action :set_pme, only: %i[ show edit update destroy ]
   before_action :authenticate_user!
  # GET /pmes or /pmes.json
  def index
    @pmes = Pme.all
  end

  # GET /pmes/1 or /pmes/1.json
  def show
  end

  # GET /pmes/new
  def new
    if current_user.pme==nil
    @pme = Pme.new
    else 
      flash[:notice] = "Vous avez déjà enrégistré une société"
      redirect_to user_dashboard_path
    end
  end

  # GET /pmes/1/edit
  def edit
  end

  # POST /pmes or /pmes.json
  def create

    @pme = Pme.new(pme_params)
    @pme.user_id=current_user.id

    respond_to do |format|
      if @pme.save
        format.html { redirect_to @pme, notice: "Pme was successfully created." }
        format.json { render :show, status: :created, location: @pme }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pmes/1 or /pmes/1.json
  def update
    respond_to do |format|
      if @pme.update(pme_params)
        format.html { redirect_to @pme, notice: "Pme was successfully updated." }
        format.json { render :show, status: :ok, location: @pme }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pmes/1 or /pmes/1.json
  def destroy
    @pme.destroy
    respond_to do |format|
      format.html { redirect_to pmes_url, notice: "Pme was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pme
      @pme = Pme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pme_params
      params.require(:pme).permit(:designation, :raison, :sector, :email, :address, :state, :status, :contact)
    end
end
