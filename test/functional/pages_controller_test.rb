require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get portfolio" do
    get :portfolio
    assert_response :success
  end

  test "should get contato" do
    get :contato
    assert_response :success
  end

end
