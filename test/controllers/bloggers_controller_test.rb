require 'test_helper'

class BloggersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bloggers_new_url
    assert_response :success
  end

  test "should get create" do
    get bloggers_create_url
    assert_response :success
  end

  test "should get view" do
    get bloggers_view_url
    assert_response :success
  end

end
