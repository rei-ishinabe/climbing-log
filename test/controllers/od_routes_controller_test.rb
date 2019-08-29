require 'test_helper'

class OdRoutesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get od_routes_index_url
    assert_response :success
  end

  test "should get show" do
    get od_routes_show_url
    assert_response :success
  end

  test "should get new" do
    get od_routes_new_url
    assert_response :success
  end

  test "should get edit" do
    get od_routes_edit_url
    assert_response :success
  end

end
