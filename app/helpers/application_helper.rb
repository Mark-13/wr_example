include ActionView::Helpers::OutputSafetyHelper

require 'action_dispatch'

class String
  def dq
    raw inspect 
  end    
end
  
class Store  
              
  def initialize (cookies)  
    @cookies = cookies  
  end  
    
  def [] (k)  
    @cookies[k]  
  end  
  
  def []= (k,v)  
    @cookies.permanent[k] = v  
  end  
  
end    

module ApplicationHelper
    
  def store 
     @store ||= Store.new(cookies)
  end

  def choose(choices)
    arr = choices.split(' ')
    arr[rand arr.length];
  end

end
