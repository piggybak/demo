require 'test_helper'

module Piggybak
	class CartControllerTest < ActionController::TestCase
	  include Devise::TestHelpers
	
	  test "cart is empty" do
	    get :show, { :use_route => :piggybak }
      cookies[:cart] = nil
	    assert_response :success
      assert_not_nil assigns(:cart)
      cart = assigns(:cart)
      assert_not_nil cart
      assert cart.empty?
	  end
	end
end
