defmodule Servy.TwilioTasks do
	@moduledoc """
	handles asynchronous dispatch to Twilio
	"""
	def twilio_url() do
		#this needs to be a configuration set item
		#for now it is hardcoded to a fake address here
		"https://damp-journey-48506.herokuapp.com"
	end

	def std_headers() do
		# nope: headers = %{ 'content-type' => "application/x-www-form-urlencoded", 'cache-control' => "no-cache" }
		headers = [{"content-type", "x-www-form-urlencoded"}, {'cache-control' , "no-cache"}]
	end

	def call_req(url, payload, headers) do
		IO.puts url
		IO.inspect payload
		IO.inspect headers
		#response = HTTPoison.put(url, payload, headers)
		response = HTTPoison.request(:post, url, payload, headers )
		process_response(response)
		response
	end

	def process_response(response) do
		#debugging this new function
		IO.inspect response
	end

	def call_twilio(the_digits \\ "000000000") do
		top_num = "+18582631960"
		from = "+14012503981"
		twilio_url = Path.join(twilio_url(), "Calls.json")
		app_url = "https://damp-journey-48506.herokuapp.com"
		callback_url = Path.join(Path.join(app_url, "connected"), the_digits)
		#payload = %{'To' => top_num, 'From' => from, 'Url' => callback_url, 'Method' => 'POST', 'SendDigits' => 'www1www1www', 'Timeout' => 20}
		headers = std_headers()
		
		body = "{:form [{'To', '#{ top_num }'}, {'From', '#{ from }'}, {'Url', '#{ callback_url }'}, {'Method', 'POST'}, {'SendDigits', 'www1www1www'}, {'Timeout', 20, ]}"
		IO.puts body
		IO.puts headers
		IO.puts twilio_url
		call_req(payload, twilio_url, headers)
	end

end
