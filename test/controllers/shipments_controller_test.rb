require 'test_helper'

class ShipmentsControllerTest < ActionDispatch::IntegrationTest

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
