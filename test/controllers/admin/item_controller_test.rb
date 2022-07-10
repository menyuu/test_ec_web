require "test_helper"

class Admin::ItemControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_item_edit_url
    assert_response :success
  end
end
