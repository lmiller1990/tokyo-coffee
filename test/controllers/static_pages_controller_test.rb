require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "| 東京コーヒー・カフェー"
		@admin = users(:admin_user)
		@non_admin = users(:regular_user)
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "Home #{@base_title}"
  end

  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Home #{@base_title}"
  end


	test "admin can access admin page after logging in" do
		get admin_path
		assert_response 302 

		sign_in(user: @admin, password: 'password')
		get admin_path
		assert_response 200
	end

	test "non admin is denied access to admin page" do
		sign_in(user: @non_admin, password: 'password')
		get admin_path
		assert_response 302
	end
end
