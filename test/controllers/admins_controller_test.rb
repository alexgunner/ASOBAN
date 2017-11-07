require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = admins(:one)
  end

  test "should get index" do
    get admins_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_url
    assert_response :success
  end

  test "should create admin" do
    assert_difference('Admin.count') do
      post admins_url, params: { admin: { can_manage_about: @admin.can_manage_about, can_manage_articles: @admin.can_manage_articles, can_manage_carousel: @admin.can_manage_carousel, can_manage_contact: @admin.can_manage_contact, can_manage_events: @admin.can_manage_events, can_manage_faq: @admin.can_manage_faq, can_manage_links: @admin.can_manage_links, can_manage_multimedia: @admin.can_manage_multimedia, can_manage_newsletter: @admin.can_manage_newsletter, first_name: @admin.first_name, last_name: @admin.last_name } }
    end

    assert_redirected_to admin_url(Admin.last)
  end

  test "should show admin" do
    get admin_url(@admin)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_url(@admin)
    assert_response :success
  end

  test "should update admin" do
    patch admin_url(@admin), params: { admin: { can_manage_about: @admin.can_manage_about, can_manage_articles: @admin.can_manage_articles, can_manage_carousel: @admin.can_manage_carousel, can_manage_contact: @admin.can_manage_contact, can_manage_events: @admin.can_manage_events, can_manage_faq: @admin.can_manage_faq, can_manage_links: @admin.can_manage_links, can_manage_multimedia: @admin.can_manage_multimedia, can_manage_newsletter: @admin.can_manage_newsletter, first_name: @admin.first_name, last_name: @admin.last_name } }
    assert_redirected_to admin_url(@admin)
  end

  test "should destroy admin" do
    assert_difference('Admin.count', -1) do
      delete admin_url(@admin)
    end

    assert_redirected_to admins_url
  end
end
