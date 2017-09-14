defmodule Servy.CallTwilio do

	import TwilioTasks

	def request_info(the_digits) do
		task = Task.async(&call_twilio/1, [the_digits])
		IO.inspect task
	end

end