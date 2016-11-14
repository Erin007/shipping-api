require 'test_helper'

class ShipmentsControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #    @request.headers['Accept'] = Mime::JSON
  #    @request.headers['Content-Type'] = Mime::JSON.to_s
  #  end

  test "should get index (shipments#find_rates)" do
    get root_url
    assert_response :success
  end

  test "index returns json" do
    get root_url
    assert_match 'application/json', response.header['Content-Type']
  end

  test "index returns an Array" do
    get root_url
    body = JSON.parse(response.body)
    assert_instance_of Array, body
  end

  test "index returns an Array of rates, where the first element in each subarray is a string (carrier/service name)" do
    get root_url
    body = JSON.parse(response.body)
    assert_instance_of String, body[0][0]
  end

  test "index returns an Array of rates, where the first element in each subarray is a string (carrier/service name) and those carriers are UPS or USPS" do
    get root_url
    body = JSON.parse(response.body)
    assert body[0][0].include? "USPS"
  end

  test "index returns an Array of rates, where the second element in each subarray is a number (cost)" do
    get root_url
    body = JSON.parse(response.body)
    assert_instance_of Fixnum, body[0][1]
  end

  test "rates returned are in ascending order" do
    get root_url
    body = JSON.parse(response.body)
    assert body[0][1] < body[1][1]
  end

end
