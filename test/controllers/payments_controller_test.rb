require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  test "should get cancel" do
    get :cancel
    assert_response :success
  end

  test "should get success" do
    get :success
    assert_response :success
  end

  test "should get notify" do
    get :notify
    assert_response :success
  end

end
