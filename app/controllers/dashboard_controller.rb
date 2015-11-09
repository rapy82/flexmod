class DashboardController < ApplicationController
	skip_before_action :authenticate, only: [:index]
	
	def index
	  @frequency = Flexgem::Modulator.read_frequency
	  @rf_power = Flexgem::Modulator.read_rfpower
	  high_level_power_key = ConfigurationKey.find_by key:'high_level_power', section:'power_level'
	  @high_level_power = high_level_power_key.nil? ? @rf_power : high_level_power_key.value
	  @mode = Flexgem::Modulator.read_mode
	  @mode_message = Flexgem::Modulator.read_mode_message
    @alarms = Alarm.all
    @source = Flexgem::System.read_source_select
    @source_message = Flexgem::System.read_source_select_message
    @flexmod_temp = Flexgem::System.read_flexmod_temp
    mode_configuration = ModeConfiguration::get_current_mode_configuration
    @mode_configuration_image = "/assets/mode_images/mode_" + mode_configuration + ".jpg"
    @forward_power = Flexgem::PowerSystem.read_forward_power
    @power_voltage = Flexgem::PowerSystem.read_power_voltage
    
	end
	
	def send_command
		command = params[:command]
		parameter = params[:parameter]
		parameter2 = params[:parameter2]
		if !command.nil?
			@response = Flexgem::Comm.submit_command(command,parameter,parameter2)
			AlarmMailer.alarm_email(command)
		end
	end
	
	def get_audio
		@audio = Flexgem::System.read_audio
		
		render :json => @audio
	end
	
	
	
end
