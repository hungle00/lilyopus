require "test_helper"

class WorksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get works_url
    assert_response :success
  end
end
