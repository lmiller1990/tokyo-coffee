require 'test_helper'

class ShopEditAndUpdateTest < ActionDispatch::IntegrationTest
  def setup
    @shop = shops(:shop_one)
    @district = districts(:district_one)
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
        japanese_name: '',
        district_id: 1
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
        district_id: @district.id,
        japanese_name: 'New updated name'
      }
    }
    assert_not flash.empty?
    assert_redirected_to @shop
    @shop.reload
    assert_equal @shop.japanese_name, 'New updated name'
  end
end
