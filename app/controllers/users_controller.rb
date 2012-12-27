class UsersController < ApplicationController
  
  def index
     @user = User.new
  end

  def create
    @user = User.new(params[:user])
      if @user.save
        @user.attach_download_token
        UserMailer.send_link(@user).deliver
        # EMAIL TO ANGSDT TEAM:
        UserMailer.download_request_notification(@user).deliver
        flash[:notice] = "We have sent a download link to <b>#{@user.email}</b>"
      end
  end

  def download
    @user = User.find_by_dtoken(params[:dtoken])
    @os = get_client_os()
  end

  def resend_token
    @user = User.find_by_email(params[:email])
    if @user.nil?
      flash[:error] = "We were unable to find a user with #{params[:email]}"
      @user= User.new
      @user.errors.add(:email, "Uknown email")
    else
      UserMailer.send_link(@user).deliver
      flash[:notice] = "We have re-sent a download link to #{@user.email}"
    end
  end


  # ensure that token is in db
  # and send_file or
  # if not in db, redirect to index
  def download_file
    @user = User.find_by_dtoken(params[:dtoken])
    @os = params[:os]
    if @user.nil?
      redirect_to :action => download
    else
      download_file = "#{BINARIES[@os]}"
      download_loc = "#{DOWNLOAD_LOC}/#{download_file}"
      download_loc = "domosaics-rv#{REVISION}.jar" if @os == 'unknown'
      send_file("#{download_loc}", :filename => "#{BINARIES[@os]}")
      # EMAIL TO ANGSDT TEAM:
      UserMailer.download_notification(@user).deliver
      #render :text => "You are in the download area... !"
    end
  end

  def thanks
  end


  private

  def get_client_os
    if request.env['HTTP_USER_AGENT'].downcase.match(/mac/i)
      return 'iOS'
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/windows/i)
      return 'Windows'
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/linux/i)
      return 'Linux'
    else  
      return 'unknown'
    end
  end

end
