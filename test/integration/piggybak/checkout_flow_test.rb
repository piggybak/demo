require 'test_helper'

module Piggybak
  class CheckoutFlowTest < ActionDispatch::IntegrationTest
    def setup_order
      post_via_redirect piggybak.cart_add_path, { sellable_id: 29, quantity: 2 }
      get_via_redirect piggybak.orders_path
    end

    def order_params
      { "order" => {
         "email" => "test@endpoint.com", 
         "phone" => "6304844834", 
         "billing_address_attributes" => {
           "firstname"=>"S", 
           "lastname"=>"S", 
           "address1"=>"123", 
           "address2"=>"", 
           "city"=>"SLC", 
           "country_id"=>"405", 
           "state_id"=>"6926", 
           "zip"=>"84115"
         }, 
         "shipping_address_attributes" => {
           "firstname" => "S", 
           "lastname"=>"S", 
           "address1"=>"123", 
           "address2"=>"", 
           "city"=>"SLC", 
           "country_id"=>"405", 
           "state_id"=>"6926", 
           "zip"=>"84115" },
         "line_items_attributes" => {
           "0" => {
             "line_item_type" => "shipment", 
             "shipment_attributes" => { 
               "shipping_method_id"=>"4"
             }
           }, 
           "1" => { 
             "line_item_type" => "payment", 
             "payment_attributes" => {
               "number" => "4111111111111111", 
               "verification_value"=>"333", 
               "month"=>"1", 
               "year"=>"2016"
             }
           }
         }
       }, 
       "piggybak_coupon_code" => "", 
       "piggybak_giftcert_code"=>""
      }
    end 

    test "checkout redirects to https" do
      post_via_redirect piggybak.cart_add_path, { sellable_id: 29, quantity: 2 }
      assert !https?
      get_via_redirect piggybak.orders_path
      assert https?
    end

    test "flows from cart to checkout properly" do
      post_via_redirect piggybak.cart_add_path, { sellable_id: 29, quantity: 2 }
      get_via_redirect piggybak.orders_path
      assert_response :success
      # TODO: Check properties of order?
      # order = assigns(:order)
      cart = assigns(:cart)
      assert_not_nil cart
      assert !cart.empty?
      assert cart.sellables.first[:quantity] == 2
      assert cart.sellables.first[:sellable].id == 29
      assert cart.total == 39.98
    end

    test "checkout fails as guest" do
      setup_order

      # Valid credentials except credit card number
      p = order_params
      p["order"]["line_items_attributes"]["1"]["payment_attributes"]["number"] = "4111"
      post_via_redirect piggybak.orders_path, p, { "User-Agent" => "Testbot" }

      # Assert checkout did not go through
      order = assigns(:order)
      assert_not_nil order  

      cart = assigns(:cart)
      assert_not_nil cart
      assert !cart.empty?
      assert cart.sellables.first[:quantity] == 2
      assert cart.sellables.first[:sellable].id == 29
      assert cart.total == 39.98
    end

    test "checkout works as guest" do
      setup_order

      post_via_redirect piggybak.orders_path, order_params, { "User-Agent" => "Testbot" }

      # Assert checkout did go through
      order = assigns(:order)
      assert_not_nil order  
      assert order.status == "new"
      assert order.user.nil?
      assert order.email == "test@endpoint.com"
      assert order.total = 49.98
      assert order.user_agent == "Testbot"
      assert order.line_items.detect { |li| li.line_item_type == "tax" }.nil?

      cart = assigns(:cart)
      assert_nil cart
    end

    test "checkout pass as logged in user" do
      setup_order

      # assert user is not logged in
      # go to login, follow redirects
      # proceed with checkout
      # assert order.user is not nil
    end

    test "tax added correctly" do
      setup_order

      p = order_params
      p["order"]["billing_address_attributes"]["state_id"] = "6907"
      p["order"]["shipping_address_attributes"]["state_id"] = "6907"
      post_via_redirect piggybak.orders_path, p, { "User-Agent" => "Testbot" }

      # Assert tax value is correct
      order = assigns(:order)
      assert_not_nil order  
      assert order.total = 42.67
      tax = order.line_items.detect { |li| li.line_item_type == "tax" }
      assert_not_nil tax
      assert tax.price == 2.69
    end

    test "checkout shipping amount accurate" do
      setup_order

      p = order_params
      p["order"]["line_items_attributes"]["0"]["shipment_attributes"]["shipping_method_id"] = "5"
      post_via_redirect piggybak.orders_path, p, { "User-Agent" => "Testbot" }

      # Assert tax value is correct
      order = assigns(:order)
      assert_not_nil order  
      assert order.total = 59.98
      shipping = order.line_items.detect { |li| li.line_item_type == "shipment" }
      assert_not_nil shipping
      assert shipping.price == 20.00
    end

    test "expired coupon does not affect order" do
      setup_order

      p = order_params
      expired_code = "RRRXPQAWHDRC"
      p["order"]["piggybak_coupon_code"] = expired_code
      p["order"]["line_items_attributes"]["2"] = {"line_item_type"=>"coupon_application", "coupon_application_attributes"=>{"code"=> expired_code } }
      post_via_redirect piggybak.orders_path, p, { "User-Agent" => "Testbot" }

# TODO: This fails. Must fix on order processing!

      # Assert tax value is correct
      order = assigns(:order)
      assert_not_nil order  

      assert order.total = 49.99
      coupon = order.line_items.detect { |li| li.line_item_type == "coupon_application" }
      assert coupon.nil?
    end

    test "used coupon does not affect order" do
    end

    test "order that does not reach minimum order total does not affect order" do
    end

    test "percent coupon applies correctly" do
      setup_order

      p = order_params
      expired_code = "APOXPQAWHDRC"
      p["order"]["piggybak_coupon_code"] = expired_code
      p["order"]["line_items_attributes"]["2"] = {"line_item_type"=>"coupon_application", "coupon_application_attributes"=>{"code"=> expired_code } }
      post_via_redirect piggybak.orders_path, p, { "User-Agent" => "Testbot" }

      # Assert tax value is correct
      order = assigns(:order)
      assert_not_nil order  

      assert order.total = 45.99
      coupon = order.line_items.detect { |li| li.line_item_type == "coupon_application" }
      assert_not_nil coupon
      assert coupon.price == -3.99
    end

    test "free shipping coupon applies correctly" do
    end

    test "dollar off coupon applies correctly" do
    end


    test "gift cert partial coverage applies correctly" do
    end

    test "gift cert full coverage applies correctly" do
    end

    test "bundle discount applies correctly" do
    end 
  end
end
