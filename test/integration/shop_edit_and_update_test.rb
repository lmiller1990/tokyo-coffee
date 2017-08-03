require 'test_helper'

class ShopEditAndUpdateTest < ActionDispatch::IntegrationTest
  def setup
    @shop = Shop.create(name: 'My shop')
    @password = "password"
    @confirmed_user = User.create(email: "#{rand(4000)}@example.com", 
                                  password: @password)
  end

  test "unsuccessfully updates a shop" do
    sign_in(user: @confirmed_user, password: @password)
    get edit_shop_path(@shop)
    assert_template 'shops/edit'
    patch shop_path(@shop), params: {
      shop: {
        name: ''
      }
    }
    assert_template 'shops/edit'
  end

  test "successfully updates a shop" do
    sign_in(user: @confirmed_user, password: @password)
    get edit_shop_path(@shop)
    assert_template 'shops/edit'
    patch shop_path(@shop), params: {
      shop: {
        name: 'New updated name'
      }
    }
    assert_not flash.empty?
    assert_redirected_to @shop
    @shop.reload
    assert_equal @shop.name, 'New updated name'
  end
end
