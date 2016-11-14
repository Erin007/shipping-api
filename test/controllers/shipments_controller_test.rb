require 'test_helper'

class ShipmentsControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #    @request.headers['Accept'] = Mime::JSON
  #    @request.headers['Content-Type'] = Mime::JSON.to_s
  #  end

  test "should get shipments#find_rates'" do
    get root_url
    assert_response :success
  end

  # test "should get show" do
  #   get shipments_show_url
  #   assert_response :success
  # end
  #
  # test "should get new" do
  #   get shipments_new_url
  #   assert_response :success
  # end
  #
  # test "should get create" do
  #   get shipments_create_url
  #   assert_response :success
  # end
  #
  # test "should get update" do
  #   get shipments_update_url
  #   assert_response :success
  # end
  #
  # test "should get destroy" do
  #   get shipments_destroy_url
  #   assert_response :success
  # end
  #
  # #ERIN
  # # Necessary setup to allow ensure we support the API JSON type
  # setup do
  #    @request.headers['Accept'] = Mime::JSON
  #    @request.headers['Content-Type'] = Mime::JSON.to_s
  #  end
  #
  # test "can get #index" do
  #   get :index
  #   assert_response :success
  # end
  #
  # test "#index returns json" do
  #   get :index
  #   assert_match 'application/json', response.header['Content-Type']
  # end
  #
  # test "#index returns an array of rate objects" do
  #   get :index
  #   # Assign the result of the response from the controller action
  #   body = JSON.parse(response.body)
  #   assert_instance_of Array, body
  # end
  #
  #
  # test "each rate object contains the relevant keys" do
  #   keys = %w( age human id name )
  #   get :index
  #   body = JSON.parse(response.body)
  #   assert_equal keys, body.map(&:keys).flatten.uniq.sort
  # end
end
