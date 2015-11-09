module FlexMod
	module Comm
	
		@end_line = "\r\n"
		@@semaphore = Mutex.new

		def self.get_serial
			start = Time.now
			serial_port = "/dev/ttyUSB0"
			@@sp ||= SerialPort.new serial_port,115200
			@@sp.read_timeout = 100
			finish = Time.now

			diff = finish - start
			puts "GetSerial: #{diff}"
			return @@sp
		end
	
		def self.send_command(command,*params)
			command = command.upcase
			puts "parameter = "+params.join(", ")
			case command
				when "FM_FREQUENCY"
					if params.any?
						puts "ci sono parametri"
						response = fm_frequency(params[0],params[1])
					else
						puts "non ci sono parametri"
						response = fm_frequency()
					end
				else
					response = "Command not recognized"
			end
		
			return response
		end
	
		def self.read_fm_frequency
			puts "Read Fm_Frequency"
			response = submit_command("FM_FREQUENCY")
			response = response[1].split(' ')[3]
		end
	
		def self.read_if_frequency
			puts "Read Fm_Frequency"
			response = submit_command("FM_FREQUENCY")
			response = response[2].split(' ')[3]
		end
	
		def self.fm_frequency(rf_freq,if_freq)
			rf_freq = "%0.1f" %[rf_freq]
			if_freq = "%0.1f" %[if_freq]
			response = submit_command("FM_FREQUENCY",rf_freq,if_freq)
		end
	
		def self.submit_command(command,*params)
			@@semaphore.synchronize do
				sp = get_serial
		
				start = Time.now
			
				command = command+" "+params.join(", ") if params.any? 
				puts "Sending command #{command}"
				command = command+@end_line
				sp.write command
			
				finish = Time.now
				diff = finish - start
				puts "Submit command: #{diff}"

				start = Time.now			
			
				#while sp.read.split(@end_line)
				response = sp.read
				response = response.split(@end_line)
				#response = sp.readlines
			
				finish = Time.now
				diff = finish - start
				puts "Read Response: #{diff}"

				return response
			end
		end
	end
end
