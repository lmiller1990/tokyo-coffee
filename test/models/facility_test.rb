require "test_helper"

class FacilityTest < ActiveSupport::TestCase
	def setup 
		@shop = shops(:shop_one)
		@facility = Facility.create(name: 'Wifi')
		@facility.shops << @shop
	end

	test 'should be valid' do
		assert @facility.valid?
		assert_equal @facility.shops.count, 1
	end
end
