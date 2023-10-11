class AgrovetsController < ApplicationController
  before_action :set_agrovet, only: %i[ show edit update destroy ]

  # GET /agrovets or /agrovets.json
  def index
    @agrovets = Agrovet.all
  end

  # GET /agrovets/1 or /agrovets/1.json
  def show
  end

  # GET /agrovets/new
  def new
    @agrovet = current_user.agrovets.build
  end

  # GET /agrovets/1/edit
  def edit
  end

  # POST /agrovets or /agrovets.json
  def create
    @agrovet = Agrovet.new(agrovet_params)
    
    respond_to do |format|
      if @agrovet.save
        format.html { redirect_to pages_salesrep_path, notice: "Agrovet was successfully created." }
        format.json { render :show, status: :created, location: @agrovet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agrovet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agrovets/1 or /agrovets/1.json
  def update
    respond_to do |format|
      if @agrovet.update(agrovet_params)
        format.html { redirect_to agrovet_url(@agrovet), notice: "Agrovet was successfully updated." }
        format.json { render :show, status: :ok, location: @agrovet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agrovet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agrovets/1 or /agrovets/1.json
  def destroy
    @agrovet.destroy

    respond_to do |format|
      format.html { redirect_to agrovets_url, notice: "Agrovet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def agrovetinfo
    @agrovet = Agrovet.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agrovet
      @agrovet = Agrovet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agrovet_params
      params.require(:agrovet).permit(:name, :location, :owner_name, :owner_phone, :owner_email, :user_id)
    end
end
