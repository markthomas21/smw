class AutoMailer < ActionMailer::Base
  default from: "info@swapmywhip.com"

#  default_url_options[:host] = "swapmywhip.com"  

  def welcome_email(user)
    @user = user
    mail(to: @user.email,
	subject: "Welcome to SwapMyWhip.com")
#    @recipients user.email
#    from       "info@swapmywhip.com"
#    @sent_on    Time.now
#    @body 	:user => user 
  end
  
  def new_message(message)
  	subject    "New Message at SwapMyWhip.com"
    recipients message.recipient.email
#    from       "info@swapmywhip.com"
    sent_on    Time.now
    body 			 :message => message
  end
  
  def contact_us_message(message)
    @message = message
    mail(to: ADMIN_EMAIL_ADDRESS,
	from: message.email,
	subject: "Message Sent Using 'Contact Us' Form: " + message.subject,
	body: message)
#    recipients ADMIN_EMAIL_ADDRESS
#    from       message.email
#    sent_on    Time.now
#    body 			 :message => message
  end
  
  def password_reset_instructions(user)
  	subject			"Password Reset Instructions for your swapmywhip.com account"
  	recipients	user.email
#  	from				"info@swapmywhip.com"
  	sent_on			Time.now
  	body				:edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end


end
