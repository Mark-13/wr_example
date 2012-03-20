f = File.open(ARGV[0],"r")
g = File.open(ARGV[1],"w")


f.each_line do |s|
  g.puts (eval "\"#{s}\"")
end


f.close
g.close