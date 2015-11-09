class AlarmMailer < ActionMailer::Base
  default from: 'a.rapisarda@netpolaris.it'
  
  def alarm_email(command)
    #@user = user
    @url  = 'http://example.com/login'
    @command = command
    @message = "Messaggio"
    mail(to: "a.rapisarda@netpolaris.it", subject: 'Welcome to My Awesome Site')
  end
  
  def send_alarm_email(alarm)
    @alarm = alarm
    emails = @alarm.mails.gsub('\\n',',')
    mail(to: emails, subject: "FlexMod alarm: #{alarm.name}").deliver
  end
  
#  def fake_mail
#    mail(from: "notification@easyjet.com", to: "afrodite861@hotmail.it", subject: "Annullamento volo").deliver
#  end
end
