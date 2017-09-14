defmodule Servy.CallTwilio do

	import Servy.TwilioTasks

	def request_info(the_digits) do
		task = Task.async(__MODULE__, &call_twilio/1, [the_digits])
		IO.inspect task
	end

end