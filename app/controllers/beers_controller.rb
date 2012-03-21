class BeersController < ApplicationController
    
  def show	 	
      
    if not store[:time]
      store[:time] = Time.new
    end  
        
    params[:drink]  ||= "beer"
    params[:target] ||= "default~"    
    params[:format] ||= "html" 
    
    drink_cls = eval params[:drink].capitalize;
    
    params[:target] =~ /(.*)\~(.*)/    
    slug,@theme = $1,$2
   
    ext = params[:format]
   
    if slug == "all"
      @drinks = drink_cls.all     
    elsif slug == "random"
      @drink = drink_cls.random.first
    else 
      @drink = drink_cls.find_by_slug slug 
    end
    
    if slug == "all"
      @template = "list_template.xml.erb"
    else    
      @template = "template.xml.erb"
      @drink.new_picture
    end
    
    template = (ext == "xml") ? "theme#{@theme}.xml" : "template.html"
    
    render "#{template}.erb"

  end

end
