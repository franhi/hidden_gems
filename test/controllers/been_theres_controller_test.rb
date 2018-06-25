require 'test_helper'

class BeenTheresControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get been_theres_create_url
    assert_response :success
  end

  test "should get destroy" do
    get been_theres_destroy_url
    assert_response :success
  end

end
