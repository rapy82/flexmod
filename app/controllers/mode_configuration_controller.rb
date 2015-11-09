class ModeConfigurationController < ApplicationController
  def index
		@mode_configuration = ModeConfiguration.new
		@mode_configuration.load()
	end
	
	def save
			@mode_configuration = ModeConfiguration.new params[:mode_configuration]
			@mode_configuration.save
			flash[:notice] = "Configuration has been successfully saved" + @mode_configuration.mode_configuration
			
			redirect_to  "/mode_configuration"
	end
end
