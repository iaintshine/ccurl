class Curl
	attr_reader :cmd, :options

	class << self
		def open(args, &block)
			me = new args
			me.run &block
			me 
		end
	end

	def initialize(args)
		@options = parse args
		@cmd     = build_cmd
	end

	def run(&block)
		raise ArgumentError, "Missing block" unless block_given?
		return if options.empty?

		begin
			PTY.spawn( cmd ) do |r, w, pid|
				begin
					r.each do |line|
						yield line
					end
				rescue Errno::EIO # GNU/Linux raises EIO
				end
			end 
		rescue PTY::ChildExited
			p "The child process exited!" 
		end
	end

private
	def parse(args)
		"".tap do |curl_options|
			args.map { |arg| arg =~ /^-(.*)/ ? " #{arg}" : " '#{arg}'" }.each { |arg| curl_options << arg }
		end
	end

	def build_cmd
		"curl -vs #{@options} 2>&1"
	end
end