class ProfileController < ApplicationController

  def show
    @user = current_user
    @setting = @user.setting
  end
end
