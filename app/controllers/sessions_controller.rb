class SessionsController < ApplicationController
    def create
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end
  
      session[:user_id] = @user.id
  
      render 'welcome/home'
    end
  
    private
  
    def auth
      request.env['omniauth.auth']
    end
  end 


#  NOTE issue below that halted this assignment for me:

#  thin start --ssl with https:// (secure) does not escape the Privacy Error block.

#  Only rails s and http:// (nonsecure) is proceeding to Facebook log in page with the message: 
#  "Insecure Login Blocked.  You can't get an access token or log in to this app from an insecure page. 
#  Try re-loading the page as https://"

#  This process was viewed on AAQ with the TC.