require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @student = Student.new(buck_id: 0000, fname: "Example", lname: "Student", email: "student@example.com", team_id: 0, password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @student.valid?
  end

  test "buck_id should be present" do
    @student.buck_id = nil
    assert_not @student.valid?
  end

  test "fname should be present" do
    @student.fname = " "
    assert_not @student.valid?
  end

  test "lname should be present" do
    @student.lname = " "
    assert_not @student.valid?
  end

  test "email should be present" do
    @student.email = " "
    assert_not @student.valid?
  end

  test "email should not be too long" do
    @student.email = "a" * 244 + "@example.com"
    assert_not @student.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @student.email = valid_address
      assert @student.valid?, "#{valid_address.inspect} should be valid"
   end
 end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                         foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @student.email = invalid_address
      assert_not @student.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @student.dup
    @student.save
    assert_not duplicate_user.valid?
  end
  
  test "password should be present (nonblank)" do
    @student.password = @student.password_confirmation = " " * 8
    assert_not @student.valid?
  end

  test "password should have a minimum length" do
    @student.password = @student.password_confirmation = "z" * 5
    assert_not @student.valid?
  end

end
