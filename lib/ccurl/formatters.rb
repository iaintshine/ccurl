module Formatters
	class AbstractFormatter
		def colorize(match_data)
			raise ArgumentError, "MatchData parameter required" unless match_data.class <= ::MatchData
		end
	end

	class HttpRequestLine < AbstractFormatter
		# http_request_line: /^> ([A-Z]*) (.*) (HTTP)\/(.*)/,
		# http://rubular.com/r/CJVqKRwq8E
		def colorize(match_data)
			super

			output = "> ".colorize(:light_cyan)
			output << match_data[1].colorize(:light_blue)
			output << " "
			output << match_data[2].colorize(:light_white)
			output << " "
			output << match_data[3].colorize(:light_blue)
			output << "/".colorize(:default)
			output << match_data[4].colorize(:light_blue)			
			output
		end
	end

	class HttpRequestHeader < AbstractFormatter
		# http_request_header: /^> (.*):(.*)/
		# http://rubular.com/r/B96THoyCn6
		def colorize(match_data)
			super

			output = "> ".colorize(:light_cyan)
			output << match_data[1].colorize(:cyan).underline
			output << ":".colorize(:default)
			output << match_data[2].colorize(:light_white)
			output
		end
	end

	class HttpResponseStatusLine < AbstractFormatter
		# http_response_status_line: /^< (HTTP)\/(.*) (\d*) (.*)/
		# http://rubular.com/r/rqTnggM0BY
		def colorize(match_data)
			super

			output = "< ".colorize(:light_green)
			output << match_data[1].colorize(:light_blue)
			output << "/".colorize(:default)
			output << match_data[2].colorize(:light_blue)
			output << " "
			output << match_data[3].colorize(:light_green)
			output << " "
			output << match_data[4].colorize(:light_blue)
			output
		end
	end

	class HttpResponseHeader < AbstractFormatter
		# http_response_header: /^< (.*):(.*)/
		def colorize(match_data)
			super

			output = "< ".colorize(:light_green)
			output << match_data[1].colorize(:magenta)#.underline
			output << ":".colorize(:default)
			output << match_data[2].colorize(:light_white)
			output
		end
	end

	class CurlOutput < AbstractFormatter
		# curl_output: /^[*] (.*)/
		# http://rubular.com/r/Y6vdlHID9O
		def colorize(match_data)
			super

			output = "* ".colorize(:light_yellow)
			output << match_data[1].colorize(:yellow)
			output
		end
	end
end