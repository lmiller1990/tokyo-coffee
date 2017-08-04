require 'test_helper'

class RegisterShopsTest < ActionDispatch::IntegrationTest

  def setup
    @district = districts(:district_one)
    @password = "password"
    @confirmed_user = User.create(email: "#{rand(4000)}@example.com",
                                  password: @password,
                                  admin: true)
  end

  test 'invalid shop registration' do
    sign_in(user: @confirmed_user, password: @password)
    get new_shop_path
    assert_no_difference 'Shop.count' do
      post shops_path, params: {
        shop: {
          japanese_name: ''
        }
      }
    end
    assert_template 'shops/new'
    assert_select ".error.message", count: 2
  end

  test 'valid shop registration with user logged in' do
    sign_in(user: @confirmed_user, password: @password)
    get new_shop_path
    assert_difference 'Shop.count', 1 do
      post shops_path, params: {
        shop: {
          japanese_name: 'Shoppy',
          district_id: @district.id
        }
      }
    end
    follow_redirect!
    assert_select ".shop.name", 'Shoppy'
  end
end
