require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def sign_in(user:, password:)
    post user_session_path, params: {
      user: {
        email: user.email,
        password: password
      }
    }
  end
end
