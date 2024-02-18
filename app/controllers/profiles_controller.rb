class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_params)
    redirect_to profile_path
    flash[:notice] = 'Profile updated successfully'
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address1, :city, :state, :country_code, :zip_code,
                                    :image)
  end
end
