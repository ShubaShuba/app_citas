require "test_helper"

class MedicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medico = medicos(:one)
  end

  test "should get index" do
    get medicos_url, as: :json
    assert_response :success
    assert_match "application/json", @response.content_type
  end

  test "should create medico" do
    assert_difference("Medico.count") do
      post medicos_url, params: {
        medico: {
          nombre: "Nuevo",
          apellidos: "Doctor",
          especialidad: "Pediatría",
          telefono: "123456789",
          email: "doctor@example.com"
        }
      }, as: :json
    end

    assert_response :created
    assert_match "application/json", @response.content_type
  end

  test "should show medico" do
    get medico_url(@medico), as: :json
    assert_response :success
    assert_match "application/json", @response.content_type
  end

  test "should update medico" do
    patch medico_url(@medico), params: {
      medico: { especialidad: "Neurología" }
    }, as: :json

    assert_response :success
    assert_match "application/json", @response.content_type
  end

  test "should destroy medico" do
    assert_difference("Medico.count", -1) do
      delete medico_url(@medico), as: :json
    end

    assert_response :no_content
  end
end
