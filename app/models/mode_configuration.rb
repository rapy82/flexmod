class ModeConfiguration 
	include ActiveModel::Model
	attr_accessor :rds_level, :mode, :source, :pre_enphasis, :ext_mpx_gain, :ext_sca_gain, :mode_configuration, :input_gain, :mpx_level
	
	def load
	  @mode_configuration = ModeConfiguration::get_current_mode_configuration
		#@mode = Flexgem::Modulator.read_mode
	  #@mode_message = Flexgem::Modulator.read_mode_message
    #@source = Flexgem::System.read_source_select
    #@source_message = Flexgem::System.read_source_select_message
    @pre_enphasis = Flexgem::Modulator.read_pre_enphasis
    @ext_mpx_gain = Flexgem::Modulator.read_readable_ext_mpx_gain
    @ext_sca_gain = Flexgem::Modulator.read_readable_ext_sca_gain
    #@rds_level = Flexgem::Modulator.read_rds_level
    @mpx_level = Flexgem::Modulator.read_mpx_level
    @input_gain = Flexgem::Modulator.read_readable_input_gain
	end
	
	def save
	  ModeConfiguration::set_current_mode_configuration @mode_configuration, @mpx_level, @input_gain, @ext_mpx_gain, @ext_sca_gain
		#Flexgem::Modulator.write_mode @mode
    #Flexgem::System.write_source_select @source
    #Flexgem::Modulator.write_pre_enphasis @pre_enphasis
    #Flexgem::Modulator.write_readable_ext_mpx_gain @ext_mpx_gain
    #Flexgem::Modulator.write_readable_ext_sca_gain @ext_sca_gain
    #Flexgem::Modulator.write_rds_level @rds_level
    #Flexgem::Modulator.write_mpx_level @mpx_level
    #Flexgem::Modulator.write_readable_input_gain @input_gain
	end
	
	def self.get_current_mode_configuration
    current_mode = ConfigurationKey.find_by key:'current_mode', section:'mode_configuration'
    !current_mode.nil? ? current_mode.value : 0
  end

  def self.set_current_mode_configuration(mode_id, mpx_level, input_gain, ext_mpx_gain, ext_sca_gain)
    
    current_mode = ConfigurationKey.find_or_create_by_key 'current_mode', section: 'mode_configuration'
    
    current_mode.value = mode_id
    current_mode.save
    
    #Flexgem::Modulator.write_readable_ext_sca_gain ext_sca_gain
    #Flexgem::Modulator.write_readable_input_gain input_gain
    #Flexgem::Modulator.write_readable_ext_mpx_gain ext_mpx_gain
    #Flexgem::Modulator.write_mpx_level mpx_level
    #Flexgem::Modulator.write_pre_enphasis pre_enphasis
    
    case mode_id.to_f
      when 1 
          Flexgem::System.write_source_select 5
          Flexgem::Modulator.write_mode 12
          Flexgem::Modulator.write_readable_ext_mpx_gain ext_mpx_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 2
          Flexgem::System.write_source_select 5
          Flexgem::Modulator.write_mode 13
          Flexgem::Modulator.write_readable_ext_mpx_gain ext_mpx_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 3
          Flexgem::System.write_source_select 5
          Flexgem::Modulator.write_mode 14
          Flexgem::Modulator.write_readable_ext_mpx_gain ext_mpx_gain
          Flexgem::Modulator.write_readable_ext_sca_gain ext_sca_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 4
          Flexgem::System.write_source_select 5
          Flexgem::Modulator.write_mode 15
          Flexgem::Modulator.write_readable_ext_mpx_gain ext_mpx_gain
          Flexgem::Modulator.write_readable_ext_sca_gain ext_sca_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 5
          Flexgem::System.write_source_select 5
          Flexgem::Modulator.write_mode 16
          Flexgem::Modulator.write_readable_ext_mpx_gain ext_mpx_gain
          Flexgem::Modulator.write_readable_ext_sca_gain ext_sca_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 6 
          Flexgem::System.write_source_select 5
          Flexgem::Modulator.write_mode 17
          Flexgem::Modulator.write_readable_ext_mpx_gain ext_mpx_gain
          Flexgem::Modulator.write_readable_ext_sca_gain ext_sca_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 7 
          Flexgem::System.write_source_select 4
          Flexgem::Modulator.write_mode 1
          Flexgem::Modulator.write_pre_enphasis 0
          Flexgem::Modulator.write_readable_input_gain input_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 8
          Flexgem::System.write_source_select 4
          Flexgem::Modulator.write_mode 1
          Flexgem::Modulator.write_pre_enphasis 50
          Flexgem::Modulator.write_readable_input_gain input_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 9
          Flexgem::System.write_source_select 4
          Flexgem::Modulator.write_mode 1
          Flexgem::Modulator.write_pre_enphasis 75
          Flexgem::Modulator.write_readable_input_gain input_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 10
          Flexgem::System.write_source_select 4
          Flexgem::Modulator.write_mode 0
          Flexgem::Modulator.write_pre_enphasis 0
          Flexgem::Modulator.write_readable_input_gain input_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 11
          Flexgem::System.write_source_select 4
          Flexgem::Modulator.write_mode 0
          Flexgem::Modulator.write_pre_enphasis 50
          Flexgem::Modulator.write_readable_input_gain input_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 12 
          Flexgem::System.write_source_select 4
          Flexgem::Modulator.write_mode 0
          Flexgem::Modulator.write_pre_enphasis 75
          Flexgem::Modulator.write_readable_input_gain input_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 13 
          Flexgem::System.write_source_select 4
          Flexgem::Modulator.write_mode 7
          Flexgem::Modulator.write_pre_enphasis 0
          Flexgem::Modulator.write_readable_input_gain input_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 14
          Flexgem::System.write_source_select 4
          Flexgem::Modulator.write_mode 7
          Flexgem::Modulator.write_pre_enphasis 50
          Flexgem::Modulator.write_readable_input_gain input_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 15
          Flexgem::System.write_source_select 4
          Flexgem::Modulator.write_mode 7
          Flexgem::Modulator.write_pre_enphasis 75
          Flexgem::Modulator.write_readable_input_gain input_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 16
          Flexgem::System.write_source_select 4
          Flexgem::Modulator.write_mode 4
          Flexgem::Modulator.write_pre_enphasis 0
          Flexgem::Modulator.write_readable_input_gain input_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 17
          Flexgem::System.write_source_select 4
          Flexgem::Modulator.write_mode 4
          Flexgem::Modulator.write_pre_enphasis 50
          Flexgem::Modulator.write_readable_input_gain input_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 18 
          Flexgem::System.write_source_select 4
          Flexgem::Modulator.write_mode 4
          Flexgem::Modulator.write_pre_enphasis 75
          Flexgem::Modulator.write_readable_input_gain input_gain
          Flexgem::Modulator.write_mpx_level mpx_level
      when 19 
          Flexgem::System.write_source_select 0
          Flexgem::Modulator.write_mode 1
          Flexgem::Modulator.write_pre_enphasis 0
          Flexgem::Modulator.write_mpx_level mpx_level
      when 20
          Flexgem::System.write_source_select 0
          Flexgem::Modulator.write_mode 1
          Flexgem::Modulator.write_pre_enphasis 50
      when 21
          Flexgem::System.write_source_select 0
          Flexgem::Modulator.write_mode 1
          Flexgem::Modulator.write_pre_enphasis 75
      when 22
          Flexgem::System.write_source_select 0
          Flexgem::Modulator.write_mode 0
          Flexgem::Modulator.write_pre_enphasis 0
          Flexgem::Modulator.write_mpx_level mpx_level
      when 23
          Flexgem::System.write_source_select 0
          Flexgem::Modulator.write_mode 0
          Flexgem::Modulator.write_pre_enphasis 50
          Flexgem::Modulator.write_mpx_level mpx_level
      when 24 
          Flexgem::System.write_source_select 0
          Flexgem::Modulator.write_mode 0
          Flexgem::Modulator.write_pre_enphasis 75
          Flexgem::Modulator.write_mpx_level mpx_level
      when 25 
          Flexgem::System.write_source_select 0
          Flexgem::Modulator.write_mode 7
          Flexgem::Modulator.write_pre_enphasis 0
          Flexgem::Modulator.write_mpx_level mpx_level
      when 26
          Flexgem::System.write_source_select 0
          Flexgem::Modulator.write_mode 7
          Flexgem::Modulator.write_pre_enphasis 50
          Flexgem::Modulator.write_mpx_level mpx_level
      when 27
          Flexgem::System.write_source_select 0
          Flexgem::Modulator.write_mode 7
          Flexgem::Modulator.write_pre_enphasis 75
          Flexgem::Modulator.write_mpx_level mpx_level
      when 28
          Flexgem::System.write_source_select 0
          Flexgem::Modulator.write_mode 4
          Flexgem::Modulator.write_pre_enphasis 0
          Flexgem::Modulator.write_mpx_level mpx_level
      when 29
          Flexgem::System.write_source_select 0
          Flexgem::Modulator.write_mode 4
          Flexgem::Modulator.write_pre_enphasis 50
          Flexgem::Modulator.write_mpx_level mpx_level
      when 30 
          Flexgem::System.write_source_select 0
          Flexgem::Modulator.write_mode 4
          Flexgem::Modulator.write_pre_enphasis 75
          Flexgem::Modulator.write_mpx_level mpx_level
      when 31 
          p "*******************************************************************************" + mpx_level
          Flexgem::System.write_source_select 1
          Flexgem::Modulator.write_mode 1
          Flexgem::Modulator.write_pre_enphasis 0
          Flexgem::Modulator.write_mpx_level mpx_level
      when 32
          Flexgem::System.write_source_select 1
          Flexgem::Modulator.write_mode 1
          Flexgem::Modulator.write_pre_enphasis 50
          Flexgem::Modulator.write_mpx_level mpx_level
      when 33
          Flexgem::System.write_source_select 1
          Flexgem::Modulator.write_mode 1
          Flexgem::Modulator.write_pre_enphasis 75
          Flexgem::Modulator.write_mpx_level mpx_level
      when 34
          Flexgem::System.write_source_select 1
          Flexgem::Modulator.write_mode 0
          Flexgem::Modulator.write_pre_enphasis 0
          Flexgem::Modulator.write_mpx_level mpx_level
      when 35
          Flexgem::System.write_source_select 1
          Flexgem::Modulator.write_mode 0
          Flexgem::Modulator.write_pre_enphasis 50
          Flexgem::Modulator.write_mpx_level mpx_level
      when 36 
          Flexgem::System.write_source_select 1
          Flexgem::Modulator.write_mode 0
          Flexgem::Modulator.write_pre_enphasis 75
          Flexgem::Modulator.write_mpx_level mpx_level
      when 37 
          Flexgem::System.write_source_select 1
          Flexgem::Modulator.write_mode 7
          Flexgem::Modulator.write_pre_enphasis 0
          Flexgem::Modulator.write_mpx_level mpx_level
      when 38
          Flexgem::System.write_source_select 1
          Flexgem::Modulator.write_mode 7
          Flexgem::Modulator.write_pre_enphasis 50
          Flexgem::Modulator.write_mpx_level mpx_level
      when 39
          Flexgem::System.write_source_select 1
          Flexgem::Modulator.write_mode 7
          Flexgem::Modulator.write_pre_enphasis 75
          Flexgem::Modulator.write_mpx_level mpx_level
      when 40
          Flexgem::System.write_source_select 1
          Flexgem::Modulator.write_mode 4
          Flexgem::Modulator.write_pre_enphasis 0
          Flexgem::Modulator.write_mpx_level mpx_level
      when 41
          Flexgem::System.write_source_select 1
          Flexgem::Modulator.write_mode 4
          Flexgem::Modulator.write_pre_enphasis 50
          Flexgem::Modulator.write_mpx_level mpx_level
      when 42
          Flexgem::System.write_source_select 5
          Flexgem::Modulator.write_mode 12
          Flexgem::Modulator.write_pre_enphasis 75
          Flexgem::Modulator.write_mpx_level mpx_level
        
    end
  end
	
end
