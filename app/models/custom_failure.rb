require 'pry'

class CustomFailure < Devise::FailureApp
  
  # Never do http authentication through Devise
  def http_auth?
  	binding.pry
    false
  end
 
  def redirect_url
  	binding.pry
    send(:"new_#{scope}_session_path", :format => (request.xhr? ? 'js' : nil ))
  end
  
end