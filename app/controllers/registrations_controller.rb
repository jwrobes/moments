require 'pry'

class RegistrationsController < Devise::RegistrationsController

	def create
		params.permit!
		build_resource(params["user"])
		puts "we are creating something"
		puts resource
		if resource.save
			if resource.active_for_authentication?
				set_flash_message :notice, :signed_up if is_navigational_format?
				# respond_with resource, location: after_sign_up_path_for(resource)
					sign_up(resource_name,resource)
					# binding.pry
					sign_in_and_redirect(resource_name, resource)
			end
		else
			clean_up_passwords resource
			return render :json => {:success => false, :errors => resource.errors.messages}
		end
	end

	def sign_up(resource_name, resource)
		sign_in(resource_name, resource)
	end

	def destroy
		current_user.moments.destroy_all
		resource.destroy
		sign_out_and_redirect(self.resource)
	end

  def sign_in_and_redirect(resource_or_scope, *args)
    options  = args.extract_options!
    scope    = Devise::Mapping.find_scope!(resource_or_scope)
    resource = args.last || resource_or_scope
    sign_in(scope, resource, options)
    return render :json => {:success => true}
  end


end