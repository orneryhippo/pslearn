defmodule Servy.CallTwilio do

	def twilio_url() do
		acct = "ACea64eff94999fd45f71ed6a397cf4251"
		auth = "3bf3e6189776034376e8fbbbbda349a5"	
		"https://#{acct}:#{auth}@api.twilio.com/2010-04-01/Accounts/#{acct}" 
	end

	def empty_response() do
		'<?xml version="1.0" encoding="UTF-8"?><Response></Response>'
	end

	def std_headers() do
		headers = %{ 'content-type' => "application/x-www-form-urlencoded", 'cache-control' => "no-cache" }
		headers
	end

	def call_req(payload, url) do
		headers = std_headers()
		IO.puts url
		IO.inspect payload
		IO.inspect headers
		HTTPoison.put(url, payload, headers)
	end

	def call_twilio(the_digits) do
		callback_url = app_url <> "/connected/" <> the_digits	
		url = twilio_url() <> "/Calls.json"
		top_num = ""
		from = ""		
		payload = {'To' => top_num,
					'From' => from, 
					'Url' => callback_url, 
					'Method' => 'POST',
					'SendDigits' => 'www1www1www',
					'Timeout' => 20
				}
		response = call_req(payload, url)
	end
end