module WickedPdfHelper
  def wicked_pdf_stylesheet_link_tag(*sources)
    css_dir = Rails.root.join('public','stylesheets')
    sources.collect { |source|
      "<style type='text/css'>#{File.read(css_dir.join(source+'.css'))}</style>"
    }.join("\n").html_safe
  end

  def wicked_pdf_image_tag(img, options={})

      image_path = img.path
      return image_tag "file://#{Rails.root.join(image_path)}", options
  end

  def wicked_pdf_javascript_src_tag(jsfile, options={})
    javascript_src_tag "file://#{Rails.root.join('public','javascripts',jsfile)}", options
  end

  def wicked_pdf_javascript_include_tag(*sources)
    sources.collect{ |source| wicked_pdf_javascript_src_tag(source, {}) }.join("\n").html_safe
  end

  def verify_http_https_file url
    uri = URI.parse(url)
    if(uri.host.present?)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if (uri.scheme.present? and uri.scheme == "https")
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      return ((response.code.to_i != 200)? false : true)
    else
      return false
    end
  end
end
