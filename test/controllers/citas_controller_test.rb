require "test_helper"

class CitasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cita = citas(:one)
  end

  test "should get index" do
    get citas_url, as: :json
    assert_response :success
  end

  test "should create cita" do
    assert_difference("Cita.count") do
      post citas_url, params: {
        cita: {
          paciente_id: @cita.paciente_id,
          medico_id: @cita.medico_id,
          fecha: "2025-05-03",
          hora: "10:00",
          motivo: "Consulta de rutina",
          estado: "pendiente"
        }
      }, as: :json
    end

    assert_response :created
  end

  test "should show cita" do
    get cita_url(@cita), as: :json
    assert_response :success
  end

  test "should update cita" do
    patch cita_url(@cita), params: {
      cita: {
        motivo: "Consulta actualizada"
      }
    }, as: :json
    assert_response :success
  end

  test "should destroy cita" do
    assert_difference("Cita.count", -1) do
      delete cita_url(@cita), as: :json
    end

    assert_response :no_content
  end
end
