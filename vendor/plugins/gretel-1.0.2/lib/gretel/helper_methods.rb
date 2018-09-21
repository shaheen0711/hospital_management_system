module Gretel
  module HelperMethods
    include ActionView::Helpers::UrlHelper
    def controller # hack because ActionView::Helpers::UrlHelper needs a controller method
    end
    
    def self.included(base)
      base.send :helper_method, :breadcrumb_for, :breadcrumb
    end
    
    def breadcrumb(*args)
      options = args.extract_options!
      name, object, auth_object = args[0], args[1], args[2]
      
      if name
        @_breadcrumb_name = name
        @_breadcrumb_object = object
        @_breadcrumb_auth_object = auth_object
      else
        if @_breadcrumb_name
          crumb = breadcrumb_for(@_breadcrumb_name, @_breadcrumb_object, @_breadcrumb_auth_object, options)
        elsif options[:show_root_alone]
          crumb = breadcrumb_for(:root, options)
        end
      end
      
      if crumb && options[:pretext]
        crumb = options[:pretext].html_safe + " " + crumb
      end
      
      crumb
    end
    
    def breadcrumb_for(*args)
      options = args.extract_options!
      link_last = options[:link_last]
      options[:link_last] = true
      separator = (options[:separator] || "&gt;").html_safe

      name, object, auth_object = args[0], args[1], args[2]
      
      crumb = Crumbs.get_crumb(name, object, auth_object)
      out = link_to_if(link_last, crumb.link.text, crumb.link.url)
      
      while parent = crumb.parent
        last_parent = parent.name
        crumb = Crumbs.get_crumb(parent.name, parent.object, parent.auth_object)
#        puts "url = "+crumb.link.url.inspect
#        puts "controller = "+crumb.link.url[:controller]+"        action = "+crumb.link.url[:action]
#        if can_access_request?(crumb.link.url[:action].to_s.to_sym,parent.auth_object.present? ? parent.auth_object : parent.object.present? ? parent.object : @current_user,:context=>crumb.link.url[:controller].to_s.to_sym)
          out = link_to(crumb.link.text, crumb.link.url) + " " + separator + " " + out
#        end
      end
      
      # TODO: Refactor this
      if options[:autoroot] && name != :root && last_parent != :root
        crumb = Crumbs.get_crumb(:root)
        out = link_to(crumb.link.text, crumb.link.url) + " " + separator + " " + out
      end
      puts out.inspect
      out
    end
  end
end