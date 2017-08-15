require 'test_helper'

class CreateADistrictTest < Capybara::Rails::TestCase
	def setup
		@admin = users(:admin_user)
		@ward = wards(:shinjuku)
	end

	test "logged in admin can create a district" do
		visit new_user_session_path
		fill_in 'user[email]', with: @admin.email
		fill_in 'user[password]', with: 'password'
		click_on 'Log in'
		assert_difference 'District.count', 1 do
			visit admin_path
			fill_in 'district[japanese_name]', with: '麻布'
			select @ward.japanese_name, from: 'district[ward_id]'
			click_button 'エリアを作成'
		end
	end
end
