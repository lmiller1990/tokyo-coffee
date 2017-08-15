require 'test_helper'

class DeleteShopTest < ActionDispatch::IntegrationTest
  def setup
    @password = "password"
    @admin_user = User.create(email: "#{rand(4000)}@example.com",
                                  password: @password,
                                  admin: true)

    @non_admin_user = User.create(email: "#{rand(4000)}@example.com",
                                  password: @password,
                                  admin: false)

    @shop = shops(:shop_without_coffee)
  end

  test "only an admin can delete a shop" do
    sign_in(user: @admin_user, password: @password)
    assert_difference 'Shop.count', -1 do
      delete shop_path(@shop)
    end
  end

  test "a regular user cannot delete a shop" do
    sign_in(user: @non_admin_user, password: @password)
    assert_no_difference 'Shop.count' do
      delete shop_path(@shop)
    end
  end
end
