class UserMailer < ActionMailer::Base

  default :from => TEAM_EMAIL

  def send_link(user)
    @user = user
    mail(:to=>user.email, :subject => "DoMosaics Download Link")
  end

  def download_request_notification(user)
    @user = user
    @datestamp = Time.now
    mail(:to => TEAM_EMAIL, :subject => "DoMosaics download request")
  end
  
  def download_notification(user)
    @user = user
    @datestamp = Time.now
    mail(:to =>TEAM_EMAIL, :subject => "DoMosaics download notification")
  end


end
