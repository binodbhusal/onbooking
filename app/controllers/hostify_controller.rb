class HostifyController < ApplicationController
  before_action :authenticate_user!
  def update
    user = User.find(params[:user_id])
    user.update(role: 'host')
    redirect_back(fallback_location: root_path)
  end
end
