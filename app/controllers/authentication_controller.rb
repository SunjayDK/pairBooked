class AuthenticationController < ApplicationController

  skip_before_action :require_login, only: [:index, :login]

  def index
    @page_title = "Login"
    redirect_to challenges_path if current_student
  end

  def login
    omniauth_hash = request.env["omniauth.auth"]
    student = Student.find_by(
      username: omniauth_hash["info"]["nickname"]
    ) || Student.create_with_omniauth(omniauth_hash)
    session[:student_id] = student.id
    redirect_to challenges_path, :notice => "Signed in!"
  end

  def logout
    session[:student_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

  def dashboard
    @page_title = "Dashboard"
    @student = current_student
    @initiated_timeslots = @student.initiated_timeslots
    @unpaired_timeslots = Timeslot.where(initiator: @student, acceptor: nil)
    @paired_timeslots = Timeslot.where(initiator: @student, acceptor: !nil) + @student.accepted_timeslots
  end

  def timezone
    @student = current_student
    if request.xhr?
      @student.time_zone = params[:time_zone]
    else
      @student.time_zone = params[:timezone][:time_zone]
    end
    @student.save
  end

  def slack_name
    @student = current_student
    if request.xhr?
      @student.slack_name = params[:slack_name]
    else
      @student.slack_name = params[:slack_name][:slack_name]
    end
    @student.save
  end

end
