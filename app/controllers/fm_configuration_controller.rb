class FmConfigurationController < ApplicationController
	#include Comm
	#include FlexMod
	def index
		@fm_configuration = FmConfiguration.new
		@fm_configuration.load()
	end
	
	def save
			@fm_configuration = FmConfiguration.new params[:fm_configuration]
			@fm_configuration.save
			flash[:notice] = "Configuration has been successfully saved"
			
			redirect_to  "/fm_configuration"
	end
	
	def create
			command = params[:command]
			parameter = params[:parameter]
			parameter2 = params[:parameter2]
			#@response = ""
			@response = Flexgem::Comm.submit_command(command,parameter,parameter2)
	end
	
	def read_fm_frequency
		@fm_frequency = Flexgem::Modulator.read_frequency
		@if_frequency = Flexgem::Modulator.read_if_frequency
	end
	
end
