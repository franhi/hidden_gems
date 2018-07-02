require 'test_helper'

class PostTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get post_tags_create_url
    assert_response :success
  end

  test "should get destroy" do
    get post_tags_destroy_url
    assert_response :success
  end

end
