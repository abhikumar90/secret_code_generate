class RegistrationsController < Devise::RegistrationsController

  skip_before_filter :require_no_authentication, only: [:new,:create,:sign_up_params]


  def new
     @secret_code = params[:id]
  super  

  end

  def create
    @user = User.new(sign_up_params)
     if @user.save
         SecretCode.find(params[:secret_code][:id]).update_attributes(user_id: @user.id)
          redirect_to secret_codes_path, notice: 'User has been successfully created.'
        #UserMailer.email_for_new_user(@user).deliver
   else
    flash[:notice] = "Please fill correct email,password and password confirmation. "
     redirect_to :back , :secret_code => params[:secret_code][:id]
   end
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
