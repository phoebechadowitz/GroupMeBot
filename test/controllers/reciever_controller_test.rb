require "test_helper"

class RecieverControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reciever_index_url
    assert_response :success
  end
end
