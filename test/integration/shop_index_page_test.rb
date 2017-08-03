require 'test_helper'

class ShopIndexPageTest < ActionDispatch::IntegrationTest
  test 'index page renders' do
    get shops_path
    assert_template 'shops/index'
  end
end
