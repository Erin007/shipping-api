require 'test_helper'

class ShipmentsControllerTest < ActionDispatch::IntegrationTest

  test "Require fields must be present in origin" do
    origin = ActiveShipping::Location.new
    fields = %w(country city state address)
    
    assert_not_nil origin, fields
  end

end
