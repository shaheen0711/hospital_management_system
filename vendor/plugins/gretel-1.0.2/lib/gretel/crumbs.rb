module Gretel
  class Crumbs
    class << self
      include ActionController::UrlWriter
      #include Rails.application.routes.url_helpers
      include ActionView::Helpers::UrlHelper
      def controller # hack because Rails.application.routes.url_helpers needs a controller method
      end
      def layout(&block)
        instance_eval &block
      end
      
      def all
        @crumbs ||= {}
      end

      def crumb(name, &block)
        all[name] = block
      end
      
      def get_crumb(name, object = nil, auth_object = nil)
        raise "Crumb '#{name}' not found." unless all[name]
        
        @object = object # share the object so we can call it from link() and parent()
        @auth_object = auth_object
        @link = nil
        @parent = nil
        
        all[name].call(object)
        Gretel::Crumb.new(@link, @parent)
      end

      def shorten_string(string, count)
        if string.length >= count
          shortened = string[0, count]
          splitted = shortened.split(/\s/)
          words = shortened.length
          splitted[0, words-1].join(" ") + ' ...'
        else
          string
        end
      end
      
      def link(text, url)
        text = text.call(@object) if text.is_a?(Proc)
        url = url.call(@object) if url.is_a?(Proc)
        
        @link = Gretel::Link.new(text, url)
      end
      
      def parent(name, object = nil, auth_object = nil)
        name = name.call(@object) if name.is_a?(Proc)
        object = object.call(@object) if object.is_a?(Proc)
        auth_object = auth_object.call(@auth_object) if auth_object.is_a?(Proc)

        @parent = Gretel::Parent.new(name, object, auth_object)
      end
    end
  end
end
