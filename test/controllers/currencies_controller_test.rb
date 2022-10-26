require "test_helper"

class CurrenciesControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get currencies_display_url
    assert_response :success
  end
end
