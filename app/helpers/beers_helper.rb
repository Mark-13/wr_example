module BeersHelper
  
  def p
   "/website/wr_view1/"
  end
  
  def pi
   ret = "/website/media/"
   ret = $AWS_S3_PATH + ret if ENV["RAILS_ENV"] == "production"
   ret 
  end 
  
  def opp(drink)
    drink.class.name == "Beer" ? Drink.first : Beer.first
  end

  def path(drink, page=false)
    "/#{drink.class.name.downcase}/#{page ? page : drink.slug}~"
  end

  ThemeMax = 4  
  def theme_next(theme) 
    int_theme = (theme=="") ? 2 : theme.to_i+1
    (int_theme > ThemeMax) ? "" : int_theme.to_s;
  end  

end


