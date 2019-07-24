require 'test_helper'

class RoutesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get routes_index_url
    assert_response :success
  end

  test "should get new" do
    get routes_new_url
    assert_response :success
  end

  test "should get edit" do
    get routes_edit_url
    assert_response :success
  end

end
