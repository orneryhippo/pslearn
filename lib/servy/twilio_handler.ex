defmodule Servy.TwilioHandler do
	use Genserver

	import Servy.TwilioTasks

	def handle_call(message, from, state) do
		# do nothing placeholder
		reply = ""
		new_state = state
		{:reply, reply, new_state}
	end

	def handle_cast(message, state) do
		# do nothing placeholder
		new_state = state
		{:noreply, new_state}
	end

	# def init(args) do
	# 	GenServer.start(__MODULE__, [], name: @name)
	# 	{:ok, state}
	# end

	def handle_info(message, state) do
		# do nothing placeholder
		{:noreply, state}
	end


end