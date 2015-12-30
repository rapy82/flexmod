include FlexmodUtils
require 'rufus-scheduler'
require 'rubygems'


scheduler = Rufus::Scheduler.new



scheduler.every("1m") do
  alarms = Alarm.all
  FlexmodUtils::check_alarms alarms
end

scheduler.every("20s") do
  FlexmodUtils::check_power_level
end


#  scheduler.every '30s' do
#    puts '***********************************************Fake... Mail'
#    AlarmMailer.fake_mail
#  end


scheduler.every '30s' do
  FlexmodUtils::check_flexmod_connected
end

scheduler.every("0.3s") do
  #p Flexgem::System.read_audio
end


