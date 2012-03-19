module Mod
  
  class String
    def dq
      inspect 
    end    
  end

  def f
    puts "F"
  end  
  
end  
    
  include Mod
  
  
  puts "cccccccc".dq