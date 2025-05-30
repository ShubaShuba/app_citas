class AgendasController < ApplicationController
  before_action :set_agenda, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :authorize_admin!, only: [:create, :update, :destroy]
  
  private
  
  def authorize_admin!
    redirect_to root_path, alert: "No autorizado" unless current_user.role == "admin"
  end
  
  # GET /agendas or /agendas.json
  def index
    @agendas = Agenda.all
  end

  # GET /agendas/1 or /agendas/1.json
  def show
  end

  # GET /agendas/new
  def new
    @agenda = Agenda.new
  end

  # GET /agendas/1/edit
  def edit
  end

  # POST /agendas or /agendas.json
  def create
    @agenda = Agenda.new(agenda_params)

    respond_to do |format|
      if @agenda.save
        format.html { redirect_to @agenda, notice: "Agenda was successfully created." }
        format.json { render :show, status: :created, location: @agenda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agendas/1 or /agendas/1.json
  def update
    respond_to do |format|
      if @agenda.update(agenda_params)
        format.html { redirect_to @agenda, notice: "Agenda was successfully updated." }
        format.json { render :show, status: :ok, location: @agenda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agendas/1 or /agendas/1.json
  def destroy
    @agenda.destroy!

    respond_to do |format|
      format.html { redirect_to agendas_path, status: :see_other, notice: "Agenda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agenda
      @agenda = Agenda.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def agenda_params
      params.expect(agenda: [ :medico_id, :fecha, :hora_inicio, :hora_fin, :disponible ])
    end
end
