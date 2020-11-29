require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get front" do
    get root_path
    assert_response :success
    assert_select "title", "Eval: Peer Evaluation"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Eval: Peer Evaluation"
  end

  test "should get student_login" do
    get student_login_path
    assert_response :success
    assert_select "title", "Student Login | Eval: Peer Evaluation"
  end

  test "should get student_home" do
    get student_home_path
    assert_response :success
    assert_select "title", "Student Home | Eval: Peer Evaluation"
  end

  test "should get student_projects" do
    get student_projects_path
    assert_response :success
    assert_select "title", "Projects | Eval: Peer Evaluation"
  end

  test "should get student_evaluations" do
    get student_evaluations_path
    assert_response :success
    assert_select "title", "Team Evaluations | Eval: Peer Evaluation"
  end

  test "should get admin_login" do
    get admin_login_path
    assert_response :success
    assert_select "title", "Admin Login | Eval: Peer Evaluation"
  end

  test "should get admin_home" do
    get admin_home_path
    assert_response :success
    assert_select "title", "Admin Home | Eval: Peer Evaluation"
  end

  test "should get admin_classes" do
    get admin_classes_path
    assert_response :success
    assert_select "title", "Classes | Eval: Peer Evaluation"
  end

  test "should get admin_class_home" do
    get admin_class_home_path
    assert_response :success
    assert_select "title", "Class Home | Eval: Peer Evaluation"
  end

  test "should get admin_team_overview" do
    get admin_team_overview_path
    assert_response :success
    assert_select "title", "Team Overview | Eval: Peer Evaluation"
  end

end
