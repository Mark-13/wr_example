class KoController < ApplicationController

  include KoHelper
  
  before_filter :default_context
    
  def show	 	
      
    @plate = Plate.find_by_name(params[:id].chomp td.to_s)
        
    ['mp3','flv','swf'].each do |type|
      @av_part = plate.parts.where("content LIKE ?","%"+type).all
      @av_type = type;
      break if av_part.count>0
    end	 
         	             	    
    @qstr = plate.templates.find_by_name('query_string').text \
      if av_part.count>0 and av_type == 'swf'

    if !td || !session[:lc_id]
      session[:lc_id] = Array.new(3).map{rand(2**50)}  	
    end
  
    if params[:id] =~ /^blog/
      render 'wr_ko_blog'       
    elsif av_part.count>0 and not td
      render 'wr_ko_av_plate'
    else 
      render 'wr_ko_plate' + td.to_s
    end
   
  end


  def index
         
    @plates = Plate.where("plate_id IS NULL").paginate(page: params[:page], per_page: 5)
        
    render 'wr_ko_index'
    
  end


  def tag
   
    @plates = Plate.where("tags LIKE ?","%#{params[:id]}%").paginate(page: params[:page], per_page: 30)	

    render 'wr_ko_plate_list'
   
  end


  def webcube

   if params[:id] == "wcube"
   
      render 'webcube_get'	

   elsif params[:id] == "update"
           
      params[:x] =  params[:x].to_f 
      params[:b] =  eval params[:b]

      p = {}      
      params.each {|k,v| p[k.to_sym] = v}            

      store[:wc] = { 
       :value => Marshal.dump(p), 
      }
            
      #render :nothing => true
      render :text => "Content-Type: text/html; charset=utf-8; \n \n ok"
            
   end   
     
  end
 
  def root
    render 'wr_ko_root'
  end  


end


//testing...
