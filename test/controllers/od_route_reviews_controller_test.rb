require 'test_helper'

class OdRouteReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get od_route_reviews_index_url
    assert_response :success
  end

  test "should get show" do
    get od_route_reviews_show_url
    assert_response :success
  end

  test "should get new" do
    get od_route_reviews_new_url
    assert_response :success
  end

  test "should get edit" do
    get od_route_reviews_edit_url
    assert_response :success
  end

end
