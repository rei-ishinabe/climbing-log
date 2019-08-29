require 'test_helper'

class SubAreasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sub_areas_index_url
    assert_response :success
  end

  test "should get show" do
    get sub_areas_show_url
    assert_response :success
  end

  test "should get new" do
    get sub_areas_new_url
    assert_response :success
  end

  test "should get edit" do
    get sub_areas_edit_url
    assert_response :success
  end

end
