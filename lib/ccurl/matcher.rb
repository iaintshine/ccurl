class Matcher
    @@matching_regexps = {
        http_request_line: /^> ([A-Z]*) (.*) (HTTP)\/(.*)/,
        http_request_header: /^> (.*):(.*)/,
        http_response_status_line: /^< (HTTP)\/(.*) (\d*) (.*)/,
        http_response_header: /^< (.*):(.*)/,
        curl_output: /^[*] (.*)/
    }

    attr_reader :kind

    def initialize(expected)
        raise ArgumentError, "Valid symbol or regexp exepected" unless @@matching_regexps.has_key?(expected) || expected.kind_of?(Regexp)
        @expected = expected.kind_of?(Regexp) ? expected : @@matching_regexps[expected]
        @kind     = expected
    end
    
    def matches?(target)
        target =~ @expected
    end

    def parse(target)
        target.match @expected
    end
end