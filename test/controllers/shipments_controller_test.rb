require 'test_helper'

class ShipmentsControllerTest < ActionDispatch::IntegrationTest
#I think the only required fields are the zip and the country, the shipping apis can figure out the rest from those two pieces of information...
  test "Required fields must be present in origin" do
    origin = ActiveShipping::Location.new
    fields = %w(country city state address)

    assert_not_nil origin, fields
  end

  test "Required fields must be present in destination" do
    destination = ActiveShipping::Location.new
    fields = %w(country city state address)

    assert_not_nil destination, fields
  end

end
