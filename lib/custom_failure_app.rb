require 'pry'

class CustomFailureApp < Devise::FailureApp
#   def redirect_url
#     if request.xhr?
#       send(:"new_#{scope}_session_path", :format => :js)
#     else
#       super
#     end
#   end
# end


 
  # Never do http authentication through Devise
  def http_auth?
    false
  end
 
  def redirect_url
    send(:"new_#{scope}_session_path", :format => (request.xhr? ? 'js' : nil ))
  end
  
end