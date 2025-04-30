require "test_helper"

class AgendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agenda = agendas(:one)
  end
  before_action :authenticate_user!
  before_action :authorize_admin!, only: [:create, :update, :destroy]

  private

  def authorize_admin!
    redirect_to root_path, alert: "No autorizado" unless current_user.role == "admin"
  end


  test "should get index" do
    get agendas_url
    assert_response :success
  end

  test "should get new" do
    get new_agenda_url
    assert_response :success
  end

  test "should create agenda" do
    assert_difference("Agenda.count") do
      post agendas_url, params: { agenda: { disponible: @agenda.disponible, fecha: @agenda.fecha, hora_fin: @agenda.hora_fin, hora_inicio: @agenda.hora_inicio, medico_id: @agenda.medico_id } }
    end

    assert_redirected_to agenda_url(Agenda.last)
  end

  test "should show agenda" do
    get agenda_url(@agenda)
    assert_response :success
  end

  test "should get edit" do
    get edit_agenda_url(@agenda)
    assert_response :success
  end

  test "should update agenda" do
    patch agenda_url(@agenda), params: { agenda: { disponible: @agenda.disponible, fecha: @agenda.fecha, hora_fin: @agenda.hora_fin, hora_inicio: @agenda.hora_inicio, medico_id: @agenda.medico_id } }
    assert_redirected_to agenda_url(@agenda)
  end

  test "should destroy agenda" do
    assert_difference("Agenda.count", -1) do
      delete agenda_url(@agenda)
    end

    assert_redirected_to agendas_url
  end
end
