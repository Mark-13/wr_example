module KoHelper
  
  attr_accessor :lc_ids, :td, :p, :pi, :wc, :r, :i_n, :plate, :plates, :av_type, :av_part, :qstr 

  def default_context 

   params[:nocache] = nil

    @i_n = 4
    
    @p = "/mysite/wr_view_ko/"
    @pi = "/mysite/static/"
    @r = 3
    
    wc0 = {dir: 'wr_webcube', img: 36, fgnd: 836, bgnd: 835, 
           altw: '62    SBFSoax', light: 'textr_fg', x: 1.25, 
           font_fn: 'Old_Copperfield', font: 'Old Copperfield', b: true
    }
  
    @wc = store[:wc] ? Marshal.load(store[:wc]) : wc0;                         


    @td = params[:id][/_td.$/] if params[:id]
       
    if td and session[:lc_ids]
      @lc_ids  =  session[:lc_ids]
      puts "lllllllllllllllll #{@lc_ids[1]}"
    else             
      @lc_ids = session[:lc_ids] = Array.new(4).map{rand(2**16)} 
      puts "LLLLLLLLLLLLLLLL #{@lc_ids[1]}"

    end

  end

  def blendMode(part)
    part.include? '_mask_' ? "MASK" : "ALPHA"
  end

  def find_tem(plate, o={recurse: true, name: "default"})
    t = plate.templates.find_by_name(o[:name]).text
    if o[:recurse] and t =~ / template *= *(\w+) /
      t = find_tem plate.children.first, recurse: false, name: $1    
    end 
    t
  end

  def f_p_td2(plate) 
                                                                     
    ret = " "

    t = find_tem(plate)
        
    bDate = true;
    match = t.scan(/<div>([^<\/>]+?)<\/div>/);
        
    match.each do |m|
      m = m[0]
      if bDate and not m =~ /{|}/
        ret += (m+"<br>\n");     
      elsif m =~ /self\.date/
         bDate = true;
      end
    end
    
    ret	   

  end

  def f_p_arr(plate)
    if  plate.children.count>0
      arr = plate.children
    else
      arr = [plate]
    end
  end
  
  def f_p_blog_img(plate) 

    ret = ""

    arr = f_p_arr plate    

    arr.each do |p|    
      d = p.get_display
      ret += "<img n='#{@i_n+=1}' source='#{pi}#{d.content}' width='#{d.width}' height='#{d.height}' blendMode='#{blendMode d.name}' wyswyg='true' />\n"
    end

    ret	
  
  end

  def f_p_blog_html(plate) 
    
    ret = ""

    arr = f_p_arr plate    

    t = find_tem(plate)

    t =~ /(.*?)(<div|<table)/m
    
    ret = $1
        
    ret += "<br>" if not ret =~ /<br>\s+$/
    
    arr.each do |p|    
      d = p.get_display
      ret += \
        "<a href=\"#{plate_path(p.name + ".xml")}\">\n"+\
        "<font face=\"imgfont1\"><font size=\"321.071259\">&#x3A;</font></font></a>\n"
    end

    ret	

  end

  def wr_font_name_A0(font)

    if font[-2,2]=="A0" 
      font   
    elsif font.length < 3 
      font[0..-2]+"A"    
    elsif font.length < 6 
      font[0..-3]+"A0"
    else
      font[0..-4]+"_A0"
    end

  end


end


