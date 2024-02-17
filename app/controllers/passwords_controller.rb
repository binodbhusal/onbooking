class PasswordsController < ApplicationController
    def show
        @user = current_user
    end
   
    def update
        @user = current_user
        @user.update(password_params)
        bypass_sign_in(@user)
        redirect_to password_path(@user)
        flash[:notice]= "Password updated successfully"
    end
    private 
   def password_params
    params.require(:password).permit(:password)
   end
end