require "test_helper"

class PhotoTest < ActiveSupport::TestCase
  def setup
		@user = users(:admin_user)
		@shop = shops(:shop_without_coffee)
		@photo = Photo.new(link: 'image.jpg', shop: @shop, user: @user)
  end

  test 'should be valid' do
    assert @photo.valid?
  end
end
