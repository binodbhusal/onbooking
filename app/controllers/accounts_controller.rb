class AccountsController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(account_params)
    redirect_to account_path(@user)
    flash[:notice] = 'Email account updated successfully'
  end

  private

  def account_params
    params.require(:account).permit(:email)
  end
end
