class ConsoleLogger
	
	attr_reader :line_number

	def initialize
		@line_number = 0
	end

	def puts(line)
		$stdout.puts format(line)
	end

	def format(line)
		next_line

		choped_line = line.chop

		if colorize?
			@base_line = base_format choped_line

			@line = "#{line_number}".colorize(:light_blue)
			@line << ":".colorize(:default)
		else
			@base_line = choped_line
			@line      = "#{line_number}:"
		end

		[@line, @base_line].join("\t")
	end

private 
	def colorize?
		$stdout.tty?
	end

	def next_line
		@line_number += 1
	end

	def base_format(line)
		output = line

		[:http_request_line, 
		 :http_request_header,
		 :http_response_status_line,
		 :http_response_header,
		 :curl_output
		 ].each do |kind|
		 	matcher = Matcher.new kind
		 	if matcher.matches? line
		 		match_data = matcher.parse line
		 		
		 		formatter = create_formatter kind
		 		output = formatter.colorize match_data 
		 		break
		 	end
		end 

		# intact
		if output == line 
			output = line.colorize(:light_white)
		end

		output
	end

	def create_formatter(kind)
		Formatters.const_get(kind.to_s.camelize).new
	end
end