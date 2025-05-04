class PacientesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_paciente, only: [:show, :update, :destroy]

  # GET /pacientes
  def index
    @pacientes = Paciente.all
    render json: @pacientes
  end

  # GET /pacientes/:id
  def show
    render json: @paciente
  end

  # POST /pacientes
  def create
    @paciente = Paciente.new(paciente_params)

    if @paciente.save
      render json: @paciente, status: :created
    else
      render json: @paciente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pacientes/:id
  def update
    if @paciente.update(paciente_params)
      render json: @paciente
    else
      render json: @paciente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pacientes/:id
  def destroy
    @paciente.destroy
    head :no_content
  end

  private

  def set_paciente
    @paciente = Paciente.find(params[:id])
  end

  def paciente_params
    params.require(:paciente).permit(:nombre, :apellidos, :direccion, :dni, :email, :telefono)
  end
end
