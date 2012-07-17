class User < ActiveRecord::Base

  require 'digest/md5'

  # this resulted in some kind of loop - dunno why
  #after_save :attach_download_token

  validates(:name, :presence => true)
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "Not a valid email!"


  def attach_download_token
      seed = self.id+rand(10276)
   		dtoken = Digest::MD5.hexdigest("#{seed}")
			update_attribute(:dtoken, dtoken)
  end


end
