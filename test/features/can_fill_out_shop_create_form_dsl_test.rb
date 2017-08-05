require "test_helper"

feature "CanFillOutShopCreateFormDsl" do
	def setup
		@district = districts(:district_one)
		@password = "password"
		@confirmed_user = User.create(email: "#{rand(4000)}@example.com",
																	password: @password,
																		admin: true)
	end

	test "user can fill out and submit form to create shop" do
	end
end
