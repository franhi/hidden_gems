require 'test_helper'

class SavesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get saves_create_url
    assert_response :success
  end

  test "should get destroy" do
    get saves_destroy_url
    assert_response :success
  end

end
