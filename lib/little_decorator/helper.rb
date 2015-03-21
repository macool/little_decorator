class LittleDecorator
  module Helper
    def decorate(item_or_collection, decorator=nil)
      if item_or_collection.respond_to?(:map)
        item_or_collection.map do |item|
          decorate(item, decorator)
        end
      else
        item = item_or_collection
        return item if LittleDecorator === item
        if decorator.nil?
          decorator = "#{item.class}Decorator".constantize
        end
        decorator.new(item, self)
      end
    end
    alias_method :d, :decorate
  end
end
