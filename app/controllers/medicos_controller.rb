class MedicosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_medico, only: [:show, :update, :destroy]

  # GET /medicos
  def index
    @medicos = Medico.all
    render json: @medicos
  end

  # GET /medicos/:id
  def show
    render json: @medico
  end

  # POST /medicos
  def create
    @medico = Medico.new(medico_params)

    if @medico.save
      render json: @medico, status: :created
    else
      render json: @medico.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medicos/:id
  def update
    if @medico.update(medico_params)
      render json: @medico
    else
      render json: @medico.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medicos/:id
  def destroy
    @medico.destroy
    head :no_content
  end

  private

  def set_medico
    @medico = Medico.find(params[:id])
  end

  def medico_params
    params.require(:medico).permit(:nombre, :apellidos, :especialidad, :telefono, :email)
  end
end
