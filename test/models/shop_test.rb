require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  def setup
    @shop = Shop.create!(japanese_name: 'Test shop', station: 'Shinjuku')
		@wifi = facilities(:wifi)
		@coffee = facilities(:coffee)
  end

  test 'should be valid' do
    assert @shop.valid?
  end

  test 'name should be present' do
    @shop.japanese_name = '    '
    assert_not @shop.valid?
  end

	test 'station name should be present' do
		@shop.station = '     '
		assert_not @shop.valid?
	end

	test 'station should not be too long' do
		@shop.station = "a" * 51
		assert_not @shop.valid?
	end

  test 'name should not be too long' do
    @shop.japanese_name = "a" * 51
    assert_not @shop.valid?
  end

	test 'shop can have one or more facilities' do
		@shop.facilities << @wifi	
		@shop.facilities << @coffee	

		assert_equal @shop.facilities.count, 2
	end

	test 'shop first_four scope should return four shops' do
		four_shops = Shop.all.first_four 
		assert_equal four_shops.count, 4
	end
end
