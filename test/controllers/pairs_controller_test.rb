require "test_helper"

class PairsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pairs_index_url
    assert_response :success
  end
end
