class CsvSenderController < ApplicationController

	def welcome
	end

	def upload_file
		render "upload_file"
	end

	def sender
		file = params[:form_fields][:file]
		emails = params[:form_fields][:emails].split(",")
		ext_name = File.extname(file.original_filename)
		if ext_name == ".csv"
			SendCsv.new.send_email(file, emails)
			flash[:notice] = "File sent"
			redirect_to "/"
		else
			flash[:alert] = "Invaild File"
			redirect_to upload_file_url 					
		end
	end
end
