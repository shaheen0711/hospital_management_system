module Gretel
  class Parent
    attr_accessor :name, :object, :auth_object
    
    def initialize(name, object, auth_object)
      @name, @object, @auth_object = name, object, auth_object
    end
  end
end