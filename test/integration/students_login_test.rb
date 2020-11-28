require 'test_helper'

class StudentsLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get student_login_path
    assert_template 'sessions/new'
    post student_login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
