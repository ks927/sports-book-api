require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar") 
 end

 test 'should be valid' do
  assert @user.valid?
 end

 test 'name should be present' do
  @user.name = "  "
  assert_not @user.valid?
 end

 test 'email should be present' do
  @user.email = "  "
  assert_not @user.valid?
 end

 test 'password should be present' do
  @user.password = "  "
  assert_not @user.valid?
 end

 test 'email should be valid' do
  @user.email = "example@google"
  assert_not @user.valid?
 end

 test 'password should be proper length' do
  @user.password = "foo"
  assert_not @user.valid?
 end
end
