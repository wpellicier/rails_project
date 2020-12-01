class SessionsController < ApplicationController
  def new
  end

  def admin_login
  end

  def admin_create
    if params[:session][:email].downcase == "giles.25@osu.edu" || params[:session][:email].downcase == "mason.906@osu.edu" || params[:session][:email].downcase == "kotak.5@osu.edu"
      if params[:session][:password] == "12345678"
        redirect_to admin_home_path
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'admin_login'
      end
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'admin_login'
      end
    end

  def create
    student = Student.find_by(email: params[:session][:email].downcase)
    if student && params[:session][:password] == student.password
      log_in student
      redirect_to student
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end

end
