class Users::RegistrationsController < Devise::RegistrationsController
 #before_filter :configure_sign_up_params, only: [:create]
 #before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
     super
   end

  # POST /resource
   def create
    build_resource(sign_up_params)
    if is_member?(resource.email)
        super
    else
        flash[:alert] = "You are not a paid member. Talk to TAMU SHPE Director of Academic Development about the Test Bank."
        clean_up_passwords resource
        redirect_to new_user_registration_path
      end  
   end

  # GET /resource/edit
   def edit
     super
   end

  # PUT /resource
   def update
     super
   end

  # DELETE /resource
   def destroy
     super
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
   def cancel
     super
   end

   protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
   def after_sign_up_path_for(resource)
     super(resource)
   end
  def is_member?(email)
      if MemberEmail.where("email = ?",email).count == 1
        return true
      else
        return false
      end
  end
  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end
  # The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
     super(resource)
   end
end
