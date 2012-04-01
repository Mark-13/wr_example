module InventiveLabs
    
  def content_sub(name, &block)
    if content_for?(name)
      yield(name)
    else
      content_for(name, &block)
    end
  end  
  
  def default_content_for(name, &block)
    name = name.kind_of?(Symbol) ? ":#{name}" : name
    out = eval("yield #{name}", block.binding)
    concat(out.empty? ? capture(&block) : out)
  end

  def inheriting_view(options = {}, &block)
    # We accept a shorthand syntax -- if options is a string, render as a file.
    return inheriting_view({:file => options}, &block) if options.is_a?(String)

    bind = options[:binding]

    # Get our differences and additions to the view we're inheriting.
    if block_given?
      bind ||= block.binding
      instance_variable_set(:@content_for_layout, capture(&block)) 
    end

    raise "Important: inheriting_view() requires a block. " +
      "An empty block (eg, using {}) is suitable." unless bind 

    # If we're inheriting a partial, lend our local context to that partial.
    options[:locals] = eval("local_assigns", bind) if options[:partial]

    # Render our parent view.
    concat(render(options))
  end
  
end  

  