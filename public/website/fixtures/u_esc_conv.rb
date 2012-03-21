#First convert unicode sequences in the file from \u0045 ri \u{0045}
#Then run this to convert file to take out those sequences and
#replace them with utf=8 (or whatever it is)


f = File.open(ARGV[0],"r")
g = File.open(ARGV[1],"w")


f.each_line do |s|
  g.puts (eval "\"#{s}\"")
end


f.close
g.close