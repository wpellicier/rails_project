require 'test_helper'

class StudentsSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get student_signup_path
    assert_no_difference 'Student.count' do
      post students_path, params: { student: { buck_id: "",
                                        fname: "",
                                        lname: "Lname",
                                        email: "user@invalid"} }
  end
    assert_template 'students/new'
  end
  test "valid signup information" do
    get student_signup_path
    assert_difference 'Student.count', 1 do
      post students_path, params: { student: { buck_id: 1,
                                        fname: "Fname",
                                        lname: "Lname",
                                        email: "user@example.com" } }
    end
    follow_redirect!
    assert_template 'students/show'
  end
end