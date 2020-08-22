class SendCsv < ApplicationService
  
  def initialize    
  end

  def send_email(file, emails)
  	new_file = generate_csv(file)
    SendFileMailer.send_promotional_email(new_file, emails).deliver_now
	end

	def generate_csv(file)
    CSV.generate(headers: true) do |newcsv|
      newcsv << %w{ReferralPageUrl LandingPageUrl}
      CSV.foreach(file.path, headers: true) do |row|
        referral_url = URI(row[0])
        landing_url =  URI(row[1])
        if referral_url.host == landing_url.host 
          newcsv << row
        end
      end
    end 
	end 
end
