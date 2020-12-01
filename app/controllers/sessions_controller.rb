class SessionsController < ApplicationController
  def new
  end
  
  def create
    student = Student.find_by(email: params[:session][:email].downcase)
    if student && student.authenticate(params[:session][:password])
      log_in student
      redirect_to student
    else
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end
  
  def destroy
  end
  
  #Not sure if this is needed
  def edit
    @student = Student.find(params[:id])
  end
  

end
