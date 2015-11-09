ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	:address => "127.0.0.1",
	:port => 25,
	#:domain => "whatever.org",
	#:user_name => "username",
	#:password => "password",
	#:authentication => "plain",
	:enable_starttls_auto => false
}
