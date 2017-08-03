require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  def setup
    @shop = Shop.new(name: 'Test shop')
  end

  test 'should be valid' do
    assert @shop.valid?
  end

  test 'name should be present' do
    @shop.name = '    '
    assert_not @shop.valid?
  end

  test 'name should not be too long' do
    @shop.name = "a" * 51
    assert_not @shop.valid?
  end

  test 'shop address should be unique' do
  end
end
