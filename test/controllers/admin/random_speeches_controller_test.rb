require "test_helper"

class Admin::RandomSpeechesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_random_speeches_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_random_speeches_create_url
    assert_response :success
  end
end
