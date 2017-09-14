defmodule Servy.Handler do

	def handle(request) do
		
	end

	def parse(request) do
		# TODO: parse the request string into a map
		conv = %{method: "GET", path: "/wildthings", resp_body: "" }
	end
	def route(conv) do
		conv = %{method: "GET", path:"/wildthings", resp_body: "Bears, Lions, Tigers"}
	end
	def format_response(conv) do
		#TODO: Use values in the map to create an HTTP response string
		"""
		HTTP/1.1 200 OK
		Content-Type: text/html
		Content-Length: 20

		Bears, Lions, Tigers
		"""

	end
end


request = """
GET /wildthings HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

expected_response = """
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 20

Bears, Lions, Tigers
"""

response = Servy.Handler.handle(request)

IO.puts response