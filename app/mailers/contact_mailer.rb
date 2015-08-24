class ContactMailer < ActionMailer::Base
	default to: 'alanbradley@live.ie'

	def contact_email(name, email, body)
		@name = name
		@email = email
		@body = body

		mail(from: email, suject: 'Contact Form Message')
	end

end
