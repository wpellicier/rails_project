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

  def student_evaluations
  end
  
  def student_signup
  end

  def admin_login
  end

  def admin_home
    @teams = Team.all
  end

  def admin_classes
  end

  def admin_class_home
  end

  def admin_team_overview
  end
end
