class Runner
	def initialize
		@logger = ConsoleLogger.new
	end
		
	def run(args)
		Curl.open args do |line|
			begin
				@logger.puts line
			rescue Errno::EPIPE
				exit 74
			end
		end
	end	
end