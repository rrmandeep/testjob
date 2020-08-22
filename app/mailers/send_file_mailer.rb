class SendFileMailer < ApplicationMailer
	def send_promotional_email(file, emails)
		attachments['file.csv'] = { mime_type: 'text/csv', content: file }
		emails = emails.join(",") 
		mail(:to => emails, :subject => "Test Subject", content_type: "text/html", body: "<html><strong>Hello there</strong></html>")
	end
end