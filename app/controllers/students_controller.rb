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
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def update

    @student = Student.find(params[:id])
    
    flash[:success] = "ID number is #{student_params}"

    
    if @student.update(student_params)
      flash[:success] = "Profile updated"
      redirect_to admin_team_overview_path
    else
      render 'edit'
    end
  end

  private

    def student_params
      params.require(:student).permit(:buck_id, :fname, :lname, :email, :team_id, :password)
    end

    def student_ratings
      params.require(:rating).permit(:rating, :user_id, :project_number, :comment)
    end
end
