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
  def rating
    @student = Student.find_by(id: session[:student_id])
    #@rating = Rating.find_by(params[:id])
  end

  private

    def student_params
      params.require(:student).permit(:buck_id, :fname, :lname, :email, :team_id, :password)
    end

    def student_ratings
      params.require(:rating).permit(:rating, :user_id, :project_number, :comment)
    end
end
