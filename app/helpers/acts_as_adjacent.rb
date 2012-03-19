module ActsAsAdjacent
  
  def self.included(base)
    base.send(:scope, :random, lambda {base.offset(rand(base.count())).limit(1)})    
  end

  def next(column)
    self.class.where("#{column} > ?", send(column)).order(column).first or
      self.class.order(column).first
  end

  def prev(column)
    self.class.where("#{column} < ?", send(column)).order(column).last or
      self.class.order(column).last
  end


end

