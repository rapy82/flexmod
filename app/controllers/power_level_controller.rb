class PowerLevelController < ApplicationController
  def index
    @from_hour_key = ConfigurationKey.find_by key: 'from_hour', section:'power_level'
    @from_minute_key = ConfigurationKey.find_by key: 'from_minute', section:'power_level'
    @to_hour_key = ConfigurationKey.find_by key:'to_hour', section:'power_level'
    @to_minute_key = ConfigurationKey.find_by key:'to_minute', section:'power_level'
    @power_percent_key = ConfigurationKey.find_by key:'power_percent', section:'power_level'
  
    @from_hour = @from_hour_key.nil? ? 0: @from_hour_key.value.to_i 
    @from_minute = @from_minute_key.nil? ? 0: @from_minute_key.value.to_i 
    @to_hour = @to_hour_key.nil? ? 0: @to_hour_key.value.to_i 
    @to_minute= @to_minute_key.nil? ? 0: @to_minute_key.value.to_i 
    @power_percent = @from_hour_key.nil? ? '100': @power_percent_key.value
    
    high_level_power_key = ConfigurationKey.find_by key:'high_level_power', section:'power_level'
    @high_level_power = high_level_power_key.value
  end
  
  def save
    from_hour_key = ConfigurationKey.find_or_create_by key: 'from_hour', section:'power_level'
    from_minute_key = ConfigurationKey.find_or_create_by key: 'from_minute', section:'power_level'
    to_hour_key = ConfigurationKey.find_or_create_by key:'to_hour', section:'power_level'
    to_minute_key = ConfigurationKey.find_or_create_by key:'to_minute', section:'power_level'
    power_percent_key = ConfigurationKey.find_or_create_by key:'power_percent', section:'power_level'
    
    date = params[:date]
    from_hour_key.value = date[:from_hour]
    from_minute_key.value = date[:from_minute]
    to_hour_key.value = date[:to_hour]
    to_minute_key.value = date[:to_minute]
    
    power_percent_value = params[:power_percent].to_f
    power_percent_key.value = params[:power_percent]
    
    from_hour_key.save
    from_minute_key.save
    to_hour_key.save
    to_minute_key.save
    power_percent_key.save
    
    high_level_power_key = ConfigurationKey.find_by key:'high_level_power', section:'power_level'
    high_level_power = high_level_power_key.value
    
    low_level_power = high_level_power.to_f / 100 * power_percent_value
    low_level_power_key = ConfigurationKey.find_or_create_by key:'low_level_power', section:'power_level'
    low_level_power_key.value = low_level_power
    low_level_power_key.save
    flash[:notice] = "Configuration has been successfully saved: Low power level set to #{low_level_power} W"
    
    redirect_to action: :index
  end
end
