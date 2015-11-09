module FlexMod
	module Comm
	
		@end_line = "\r\n"
		@@semaphore = Mutex.new

		def self.get_serial
			start = Time.now
			serial_port = "/dev/ttyUSB0"
			if @@sp.nil?= SerialPort.new serial_port,115200
			@@sp.read_timeout = 100
			finish = Time.now

			diff = finish - start
			puts "GetSerial: #{diff}"
			puts "Set Echo OFF"
			
			return @@sp
		end
	
	
		def self.submit_command(command,*params)
			@@semaphore.synchronize do
				sp = get_serial
		
				start = Time.now
				
				
				command = command+" "+params.join(", ") if params.any? 
				puts "Sending command #{command}"
				command = command+@end_line
				sp.write command
			
				#finish = Time.now
				#diff = finish - start
				#puts "Submit command: #{diff}"

				#start = Time.now			
			
				#while sp.read.split(@end_line)
				response = sp.read
				puts response
				response = response.split(@end_line)
				#response = sp.readlines
			
				#finish = Time.now
				#diff = finish - start
				#puts "Read Response: #{diff}"
				puts "Response: #{response}"
				return response
			end
		end
	end
	
	def self.read_baud_rate
		puts "Read Baud Rate"
		response = Comm.submit_command("BAUD")
		response = response[2].split(' ')[3]
	end
	
	def self.write_baud_rate(baud)
		puts "Read Baud Rate"
		response = Comm.submit_command("BAUD",baud)
		response = response[2].split(' ')[3]
	end
	
	def self.read_fm_rfpower
		puts "Read Fm Power"
		response = Comm.submit_command("FM_RFPOWER")
		response = response[2].split(' ')[3]
	end
	
	def self.write_fm_rfpower(fm_rfpower)
		puts "Write FM RFPOWER"
		response = Comm.submit_command("FM_RFPOWER",fm_rfpower)
		response = response[2].split(' ')[3]
	end
	
	def self.read_fm_frequency
		puts "Read Fm_Frequency"
		response = Comm.submit_command("MOD_FREQUENCY")
		response = response[1].split(' ')[3]
	end

	def self.read_if_frequency
		puts "Read Fm_Frequency"
		response = Comm.submit_command("FM_FREQUENCY")
		response = response[2].split(' ')[3]
	end

	def self.write_fm_frequencies(rf_freq,if_freq)
		rf_freq = "%0.1f" %[rf_freq]
		
		if !if_freq.nil? && !if_freq.empty? 
			if_freq = "%0.1f" %[if_freq]
			response = Comm.submit_command("MOD_FREQUENCY",rf_freq,if_freq)
		else
			response = Comm.submit_command("MOD_FREQUENCY",rf_freq)
		end
	end
	
	def self.send_command(command,*params)
		command = command.upcase
		puts "parameter = "+params.join(", ")
		params = params.select {|param| !param.empty? }
		puts "Mando parametri #{params}"
		response = Comm.submit_command(command,*params)
	
		return response
	end
end
