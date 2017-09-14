defmodule Servy.CallTwilio do
	def twilio_url() do
		_acct = "ACea64eff94999fd45f71ed6a397cf4251"
		_auth = "3bf3e6189776034376e8fbbbbda349a5"	
		"https://#{_acct}:#{_auth}@api.twilio.com/2010-04-01/Accounts/#{_acct}" 
	end

	def show() do
		IO.puts "#{test_sid}"
		IO.puts "#{test_auth}"

	end
end