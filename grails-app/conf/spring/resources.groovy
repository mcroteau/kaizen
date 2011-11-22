// Place your Spring DSL code here
beans = {
	mailSender(org.springframework.mail.javamail.JavaMailSenderImpl) {
	   host = 'https://email.us-east-1.amazonaws.com'
	}
	// You can set default email bean properties here, eg: from/to/subject
	mailMessage(org.springframework.mail.SimpleMailMessage) {
	   from = 'franklins13app@gmail.com'
	}	
}

