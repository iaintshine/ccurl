begin
	require 'colorize'
rescue LoadError
	puts "Install 'colorize' gem. Execute 'gem install colorize'."
end

require 'pty'

require File.dirname(__FILE__) + "/core_ext/string/camelize"
require File.dirname(__FILE__) + "/ccurl/version"
require File.dirname(__FILE__) + "/ccurl/curl"
require File.dirname(__FILE__) + "/ccurl/matcher"
require File.dirname(__FILE__) + "/ccurl/formatters"
require File.dirname(__FILE__) + "/ccurl/logger"
require File.dirname(__FILE__) + "/ccurl/runner"
