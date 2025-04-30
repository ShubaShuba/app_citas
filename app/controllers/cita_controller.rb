class CitaController < ApplicationController
  before_action :set_citum, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :authorize_admin!, only: [:create, :update, :destroy]
  
  private
  
  def authorize_admin!
    redirect_to root_path, alert: "No autorizado" unless current_user.role == "admin"
  end
  
  # GET /cita or /cita.json
  def index
    @cita = Citum.all
  end

  # GET /cita/1 or /cita/1.json
  def show
  end

  # GET /cita/new
  def new
    @citum = Citum.new
  end

  # GET /cita/1/edit
  def edit
  end

  # POST /cita or /cita.json
  def create
    @citum = Citum.new(citum_params)

    respond_to do |format|
      if @citum.save
        format.html { redirect_to @citum, notice: "Citum was successfully created." }
        format.json { render :show, status: :created, location: @citum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @citum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cita/1 or /cita/1.json
  def update
    respond_to do |format|
      if @citum.update(citum_params)
        format.html { redirect_to @citum, notice: "Citum was successfully updated." }
        format.json { render :show, status: :ok, location: @citum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @citum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cita/1 or /cita/1.json
  def destroy
    @citum.destroy!

    respond_to do |format|
      format.html { redirect_to cita_path, status: :see_other, notice: "Citum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citum
      @citum = Citum.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def citum_params
      params.expect(citum: [ :paciente_id, :medico_id, :consultorio_id, :fecha, :hora, :motivo, :estado ])
    end
end
