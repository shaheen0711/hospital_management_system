WickedPdf.config = {
    :wkhtmltopdf => '/opt/wkhtmltopdf',
    :layout => "pdf.html",
    :margin => {    :top=> 20,
                    :bottom => 20,
                    :left=> 20,
                    :right => 20},
    :header => {:html => { :template=> 'layouts/pdf_header.html'}},
    :footer => {:html => { :template=> 'layouts/pdf_footer.html'}}
    #:exe_path => '/usr/bin/wkhtmltopdf'
}