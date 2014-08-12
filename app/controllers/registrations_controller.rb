class RegistrationsController < Devise::RegistrationsController

	def destroy
		current_user.moments.destroy_all
		resource.destroy
		sign_out_and_redirect(self.resource)
	end

end