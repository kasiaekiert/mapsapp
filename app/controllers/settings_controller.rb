class SettingsController < ApplicationController

  def update
    @setting = current_user.setting
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to profile_path, notice: "<%= t('.setting_updated')%>" }
        format.json { render :show, status: :ok, location: @setting }
      else
        format.html { render profile_path }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end 

  private

  def setting_params
    params.require(:setting).permit(:locale)
  end

end
