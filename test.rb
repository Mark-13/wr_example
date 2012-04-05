require 'uri'

def uri(s)
  URI.escape(s, /[^#{URI::PATTERN::UNRESERVED}]/)
end

$S = uri "Hello:::??? "



puts $S