class PagesController < ApplicationController
  def front
  end

  def about
  end

  def student_login
  end

  def student_home
  end

  def student_projects
  end

  def student_evaluation
    @evaluation = current_student.evaluations.build if logged_in?
  end
  
  def student_signup
  end

  def admin_login
  end

  def admin_home
    @students = Student.all
    @teams = Array.new
  end

  def admin_class_home
  end

  def admin_team_overview
    @student = Student.all

  end
  
  #Not sure if this is needed
  def edit
    @student = Student.find(params[:id])
  end
  
end
