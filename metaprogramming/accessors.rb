module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    attr_accessor :history
    attr_reader :name
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        
        define_method("#{name}=".to_sym) do |value|
          @history ||= []
          @history_value ||= {}
          instance_variable_set(var_name, value)
          @history_value << instance_variable_get(var_name)
          @history[name] = @history_value[0...-1]
        end

        define_method("#{name}_history") do
          @history.reverse.map { |value| puts value }
        end
        
      end
    end

    def strong_attr_accessor(name, type)
      var_name = "@#{name}".to_sym
      
      define_method(name) { instance_variable_get(var_name) }
      
      define_method("#{name}=".to_sym) do |value|
        value.class == type ? instance_variable_set(var_name, value) : raise('Incorrect type')
      end
      
    end
  end
end
