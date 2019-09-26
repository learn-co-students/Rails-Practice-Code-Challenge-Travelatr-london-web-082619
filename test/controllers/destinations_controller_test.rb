require 'test_helper'

class DestinationsControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get destinations_view_url
    assert_response :success
  end

end
