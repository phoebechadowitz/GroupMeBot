require "test_helper"

class RecieversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reciever = recievers(:one)
  end

  test "should get index" do
    get recievers_url
    assert_response :success
  end

  test "should get new" do
    get new_reciever_url
    assert_response :success
  end

  test "should create reciever" do
    assert_difference("Reciever.count") do
      post recievers_url, params: { reciever: {  } }
    end

    assert_redirected_to reciever_url(Reciever.last)
  end

  test "should show reciever" do
    get reciever_url(@reciever)
    assert_response :success
  end

  test "should get edit" do
    get edit_reciever_url(@reciever)
    assert_response :success
  end

  test "should update reciever" do
    patch reciever_url(@reciever), params: { reciever: {  } }
    assert_redirected_to reciever_url(@reciever)
  end

  test "should destroy reciever" do
    assert_difference("Reciever.count", -1) do
      delete reciever_url(@reciever)
    end

    assert_redirected_to recievers_url
  end
end
