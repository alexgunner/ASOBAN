require 'test_helper'

class AgendaEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agenda_entry = agenda_entries(:one)
  end

  test "should get index" do
    get agenda_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_agenda_entry_url
    assert_response :success
  end

  test "should create agenda_entry" do
    assert_difference('AgendaEntry.count') do
      post agenda_entries_url, params: { agenda_entry: { event_id: @agenda_entry.event_id, pdf: @agenda_entry.pdf } }
    end

    assert_redirected_to agenda_entry_url(AgendaEntry.last)
  end

  test "should show agenda_entry" do
    get agenda_entry_url(@agenda_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_agenda_entry_url(@agenda_entry)
    assert_response :success
  end

  test "should update agenda_entry" do
    patch agenda_entry_url(@agenda_entry), params: { agenda_entry: { event_id: @agenda_entry.event_id, pdf: @agenda_entry.pdf } }
    assert_redirected_to agenda_entry_url(@agenda_entry)
  end

  test "should destroy agenda_entry" do
    assert_difference('AgendaEntry.count', -1) do
      delete agenda_entry_url(@agenda_entry)
    end

    assert_redirected_to agenda_entries_url
  end
end
