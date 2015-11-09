module FlexmodUtils
  def check_power_level
    #p "Check Power Level"
    from_hour_key = ConfigurationKey.find_by key: 'from_hour', section:'power_level'
    from_minute_key = ConfigurationKey.find_by key: 'from_minute', section:'power_level'
    to_hour_key = ConfigurationKey.find_by key:'to_hour', section:'power_level'
    to_minute_key = ConfigurationKey.find_by key:'to_minute', section:'power_level'
    power_percent_key = ConfigurationKey.find_by key:'power_percent', section:'power_level'
    #low_level_power_key = ConfigurationKey.find_by key:'low_level_power', section:'power_level'
    high_level_power_key = ConfigurationKey.find_by key:'high_level_power', section:'power_level'

    from_hour = from_hour_key.nil? ? 0: from_hour_key.value.to_i 
    from_minute = from_minute_key.nil? ? 0: from_minute_key.value.to_i 
    to_hour = to_hour_key.nil? ? 0: to_hour_key.value.to_i 
    to_minute= to_minute_key.nil? ? 0: to_minute_key.value.to_i 
    power_percent = from_hour_key.nil? ? '100': power_percent_key.value
    #low_level_power = low_level_power_key.nil? ? 0: low_level_power_key.value
    high_level_power = high_level_power_key.nil? ? 0: high_level_power_key.value
    
    from_time = DateTime.now.change({:hour => from_hour , :min => from_minute , :sec => 0 })
    to_time = DateTime.now.change({:hour => to_hour , :min => to_minute , :sec => 0 })
    
    if from_hour > to_hour 
      to_time += 1.day
    end
    
    now_time = DateTime.now.change({ :sec => 0 })
    
    #puts "Now: #{now_time}"
    #puts "From: #{from_time}"
    #puts "Now: #{to_time}"
    
    low_level_power = high_level_power.to_f / 100 * power_percent.to_f
    low_level_power_key = ConfigurationKey.find_or_create_by key:'low_level_power', section:'power_level'
    low_level_power_key.value = low_level_power
    low_level_power_key.save
    
    current_power_level = Flexgem::Modulator.read_rfpower
    
    if now_time > from_time and now_time < to_time
      #set power level to low_level_power
      if current_power_level.to_f != low_level_power.to_f
        puts "Change power level value to low: #{low_level_power}"
        Flexgem::Modulator.write_rfpower low_level_power
      end
    else
      #set power level to high_level_power
      if current_power_level.to_f != high_level_power.to_f 
        puts "Change power level value to high: #{high_level_power}"
        Flexgem::Modulator.write_rfpower high_level_power
      end
    end
  end
  
  def check_flexmod_connected
      unless Flexgem::Comm.flexmod_connected
      config = YAML.load_file( File.join( Rails.root, 'config', 'flexmod_config.yml' ) )
      begin
        Flexgem::Comm.init config
      rescue StandardError
        puts "Error configuring serial_port - Please check connection on specified port"
      end
    end
  end
  
  def check_alarms(alarms)
    #p "Check Alarms"
    
	  if alarms.any? 
		  count = alarms.size
		  alarms.each do |alarm|
		    if !alarm.suspended and alarm.enabled
		      alarmed = false
		      alarm.alarm_conditions.each do |alarm_condition|
		        result = Flexgem::Comparator.compare_alarm_condition(alarm_condition)
		        if(result)
		          alarm.suspended = true
		          alarm.save
		          alarmed = true
		        end
		      end
		      AlarmMailer.send_alarm_email alarm if alarmed
		    end
		  end
	  end
  end
  
end
