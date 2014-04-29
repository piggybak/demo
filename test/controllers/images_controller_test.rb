require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get item that is in stock" do
    get :show, { 'id' => 'pollination' }
    assert_response :success
    assert_not_nil assigns(:image)
    assert_select "#submit"
    assert_select "#sellable_details span#price", "$19.99"
  end

  test "should get item that is not in stock" do
    get :show, { 'id' => 'japanese-maple' }
    assert_response :success
    assert_not_nil assigns(:image)
    assert_no_tag 'input', :attributes => {:id => 'submit' }
  end
end
