require "application_system_test_case"

class CitaTest < ApplicationSystemTestCase
  setup do
    @citum = cita(:one)
  end

  test "visiting the index" do
    visit cita_url
    assert_selector "h1", text: "Cita"
  end

  test "should create citum" do
    visit cita_url
    click_on "New citum"

    fill_in "Consultorio", with: @citum.consultorio_id
    fill_in "Estado", with: @citum.estado
    fill_in "Fecha", with: @citum.fecha
    fill_in "Hora", with: @citum.hora
    fill_in "Medico", with: @citum.medico_id
    fill_in "Motivo", with: @citum.motivo
    fill_in "Paciente", with: @citum.paciente_id
    click_on "Create Citum"

    assert_text "Citum was successfully created"
    click_on "Back"
  end

  test "should update Citum" do
    visit citum_url(@citum)
    click_on "Edit this citum", match: :first

    fill_in "Consultorio", with: @citum.consultorio_id
    fill_in "Estado", with: @citum.estado
    fill_in "Fecha", with: @citum.fecha
    fill_in "Hora", with: @citum.hora.to_s
    fill_in "Medico", with: @citum.medico_id
    fill_in "Motivo", with: @citum.motivo
    fill_in "Paciente", with: @citum.paciente_id
    click_on "Update Citum"

    assert_text "Citum was successfully updated"
    click_on "Back"
  end

  test "should destroy Citum" do
    visit citum_url(@citum)
    click_on "Destroy this citum", match: :first

    assert_text "Citum was successfully destroyed"
  end
end
