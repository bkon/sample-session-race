require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should get a" do
    get :a
    assert_response :success
  end

  test "should get b" do
    get :b
    assert_response :success
  end

  test "should get c" do
    get :c
    assert_response :success
  end

end
