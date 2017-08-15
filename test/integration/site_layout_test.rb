require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_url
    assert_template 'static_pages/home'
    assert_select "a[href=?]", new_user_session_path
  end
end
