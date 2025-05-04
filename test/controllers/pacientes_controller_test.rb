require "test_helper"

class PacientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paciente = pacientes(:one)
  end

  test "should get index" do
    get pacientes_url, as: :json
    assert_response :success
    assert_match "application/json", @response.content_type
  end

  test "should create paciente" do
    assert_difference("Paciente.count") do
      post pacientes_url, params: {
        paciente: {
          nombre: "Nuevo",
          apellidos: "Paciente",
          direccion: "Calle 123",
          dni: "99999999X",
          email: "nuevo@example.com",
          telefono: "123456789"
        }
      }, as: :json
    end

    assert_response :created
    assert_match "application/json", @response.content_type
  end

  test "should show paciente" do
    get paciente_url(@paciente), as: :json
    assert_response :success
    assert_match "application/json", @response.content_type
  end

  test "should update paciente" do
    patch paciente_url(@paciente), params: {
      paciente: { nombre: "Modificado" }
    }, as: :json

    assert_response :success
    assert_match "application/json", @response.content_type
  end

  test "should destroy paciente" do
    assert_difference("Paciente.count", -1) do
      delete paciente_url(@paciente), as: :json
    end

    assert_response :no_content
  end
end
