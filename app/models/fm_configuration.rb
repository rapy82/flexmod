class FmConfiguration 
	include ActiveModel::Model
	attr_accessor :fm_frequency, :fm_rfpower
	
	def load
    current_frequency = Flexgem::Modulator.read_frequency
    current_power_level = Flexgem::Modulator.read_rfpower
    
	  high_level_power_key = ConfigurationKey.find_or_create_by key:'high_level_power', section:'power_level'
	  
    if high_level_power_key.value.nil?
      high_level_power_key.value = current_power_level
      high_level_power_key.save
    end
    
		@fm_frequency = current_frequency
		@fm_rfpower = high_level_power_key.value
	end
	
	def save
		Flexgem::Modulator.write_frequency(@fm_frequency)
		Flexgem::Modulator.write_rfpower(@fm_rfpower)
    high_level_power_key = ConfigurationKey.find_or_create_by key:'high_level_power', section:'power_level'
    high_level_power_key.value = @fm_rfpower
    high_level_power_key.save
	end
	
end
