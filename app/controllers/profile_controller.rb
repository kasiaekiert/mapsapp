class ProfileController < ApplicationController

  def show
    @user = current_user
    @setting = @user.setting || Setting.create(user: @user, locale: :en)
  end
end
