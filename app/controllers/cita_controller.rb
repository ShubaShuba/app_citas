class CitasController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_cita, only: [:show, :update, :destroy]

  # GET /citas
  def index
    @citas = Cita.includes(:paciente, :medico).all
    render json: @citas.as_json(include: [:paciente, :medico])
  end

  # GET /citas/:id
  def show
    render json: @cita.as_json(include: [:paciente, :medico])
  end

  # POST /citas
  def create
    @cita = Cita.new(cita_params)
    if @cita.save
      render json: @cita, status: :created
    else
      render json: @cita.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /citas/:id
  def update
    if @cita.update(cita_params)
      render json: @cita
    else
      render json: @cita.errors, status: :unprocessable_entity
    end
  end

  # DELETE /citas/:id
  def destroy
    @cita.destroy
    head :no_content
  end

  private

  def set_cita
    @cita = Cita.find(params[:id])
  end

  def cita_params
    params.require(:cita).permit(:paciente_id, :medico_id, :fecha, :hora, :motivo, :estado)
  end
end
