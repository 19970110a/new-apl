require "test_helper"

class DrinksControllerTest < ActionDispatch::IntegrationTest
  test "should get choose" do
    get drinks_choose_url
    assert_response :success
  end
end
