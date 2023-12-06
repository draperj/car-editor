require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "name" do
    assert_equal "Joshua.draper", users(:jd).name
  end
end