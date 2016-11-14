require 'test_helper'

class ShipmentsControllerTest < ActionDispatch::IntegrationTest
# <<<<<<< HEAD
#I think the only required fields are the zip and the country, the shipping apis can figure out the rest from those two pieces of information...
  # test "Required fields must be present in origin" do
  #   origin = ActiveShipping::Location.new
  #   fields = %w(country zip)
  #
  #   assert_not_nil origin, fields
  # end
  #
  # test "Required fields must be present in destination" do
  #   destination = ActiveShipping::Location.new
  #   fields = %w(country zip)
  #
  #   assert_not_nil destination, fields
# =======

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
>>>>>>> tests
  end

end
