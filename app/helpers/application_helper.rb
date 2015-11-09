module ApplicationHelper
	
	@end_line = "\r"

	@sp = nil
	
	
	
	def self.get_serial
		if @sp.nil?
			serial_port = "/dev/ttyUSB0" if serial_port.nil?
			puts serial_port
			@sp = SerialPort.new serial_port,115200
			@sp.read_timeout = 1000
			puts "Retrieved Serial Port"
		end
		return @sp
	rescue
		puts "riprovo"
		serial_port = "/dev/ttyUSB1"
		retry
	end
	
	def self.send_command(command,*params)
		command = command.upcase
		puts "parameter = "+params.join(", ")
		case command
			when "FM_FREQUENCY"
				if params.any?
					response = fm_frequency(params[0],0)
				else
					response = fm_frequency()
				end
			else
				response = "Command not recognized"
		end
		
		return response
	end
	
	def self.fm_frequency
		puts "Read Fm_Frequency"
		response = submit_command("FM_FREQUENCY")
		
	end
	
	def self.fm_frequency(rf_freq,if_freq)
		puts "Write Fm_Frequency"
		response = submit_command("FM_FREQUENCY",rf_freq,if_freq)
	end
	
	def self.submit_command(command,*params)
		sp = get_serial
		
		puts params.size
		command = command+" "+params.join(", ") if params.any? 
		puts "Sending command #{command}"
		command = command+@end_line
		sp.write command
		return sp.readlines
	end
end
