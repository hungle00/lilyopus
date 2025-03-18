require "test_helper"

class LilyOpusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lily_opus_index_url
    assert_response :success
  end
end
