class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params) 
    if @student.save
      flash[:success] = "Welcome to Eval!"
      redirect_to @student
    else
      render 'new'
    end
  end

  #needs work, not done
  def evaluation
    @student = Student.all
    @current_student = Student.find_by(id: session[:student_id])
  end

  # once admin clicks on a team
  # shows all ratings for the team for all projects
  def admin_projects
    @teams = Array.new
    @members = Array.new
    @student = Student.all
    @student.each do |student|
        if @teams.exclude?(student.team_id)
          @teams.push(student.team_id)
        end
    end
    @evaluations = Evaluation.all
  end
  
  def destroy
    Student.find(params[:id]).destroy
    Evaluation.find_by(evaluator_id: params[:id]).destroy
    flash[:success] = "User and all reviews deleted"
    redirect_to '/admin_team_overview'
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      flash[:success] = "#{@student.fname} #{@student.lname}'s profile updated"
      redirect_to admin_team_overview_path
    else
      render 'edit'
    end
  end
  
  private
    def student_params
      params.require(:student).permit(:buck_id, :fname, :lname, :email, :team_id, :password)
    end
end