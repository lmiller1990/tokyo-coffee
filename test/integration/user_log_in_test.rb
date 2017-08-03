require 'test_helper'

class UserLogInTest < ActionDispatch::IntegrationTest

  def setup
    @password = "password"
    @confirmed_user = User.create(email: "#{rand(4000)}@example.com", 
                                  password: @password)
  end

  test "successful login of confirmed user" do
    sign_in(user: @confirmed_user, password: @password)
    assert_redirected_to root_url
  end
end
