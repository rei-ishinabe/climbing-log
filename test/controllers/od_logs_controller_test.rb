require 'test_helper'

class OdLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get od_logs_index_url
    assert_response :success
  end

  test "should get show" do
    get od_logs_show_url
    assert_response :success
  end

  test "should get new" do
    get od_logs_new_url
    assert_response :success
  end

  test "should get edit" do
    get od_logs_edit_url
    assert_response :success
  end

end
