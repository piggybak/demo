require 'test_helper'

class CartFlowTest < ActionDispatch::IntegrationTest
  test "add to cart redirects properly" do
    post piggybak.cart_add_path
    assert_redirected_to controller: "piggybak/cart", action: "show"
  end

  test "post to cart nothing won't add to cart" do
    post_via_redirect piggybak.cart_add_path, {}
    cart = assigns(:cart)
    assert_not_nil cart
    assert cart.empty?
  end 

  test "post to cart params will add to cart" do
    post_via_redirect piggybak.cart_add_path, { sellable_id: 29, quantity: 2 }
    cart = assigns(:cart)
    assert_not_nil cart
    assert cart.sellables.first[:quantity] == 2
    assert cart.sellables.first[:sellable].id == 29
    assert cart.total == 39.98
    assert !cart.empty?
  end

  test "remove item from cart" do
    post_via_redirect piggybak.cart_add_path, { sellable_id: 29, quantity: 1 }
    delete_via_redirect piggybak.remove_item_path("29")
    cart = assigns(:cart)
    assert_not_nil cart
    assert cart.empty?
  end

  test "item updated in cart" do
    post_via_redirect piggybak.cart_add_path, { sellable_id: 29, quantity: 1 }
    post_via_redirect piggybak.cart_update_path, { quantity: { "29" => "3" } }
    cart = assigns(:cart)
    assert_not_nil cart
    assert !cart.empty?
    assert cart.sellables.first[:quantity] == 3
    assert cart.sellables.first[:sellable].id == 29
    assert cart.total == 59.97
  end

  test "quantity limited on updated item" do
    post_via_redirect piggybak.cart_add_path, { sellable_id: 14, quantity: 10 }
    post_via_redirect piggybak.cart_update_path, { quantity: { "14" => "30" } }
    cart = assigns(:cart)
    assert_not_nil cart
    assert !cart.empty?
    assert cart.sellables.first[:quantity] == 20
    assert cart.sellables.first[:sellable].id == 14
    assert cart.total == 399.80
  end
end
