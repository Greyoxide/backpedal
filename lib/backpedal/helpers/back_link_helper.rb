# module BackLinkHelper
#   def back_link(path = nil)
#     if path.present?
#       link_to path, class: "back_link" do
#         concat content_tag :i, "", class: "fas fa-chevron-left"
#         concat "Back"
#       end
# 
#     elsif session[:tree].present?
#       last = session[:tree].split(",").last
#       link_to last, class: "back_link" do
#         concat content_tag :i, "", class: "fas fa-chevron-left"
#         concat "Back"
#       end
#     end
#   end
# end


module BackLinkHelper

  def back_link(path_to = nil, options = nil, html_options = nil, &block)
    
    path_to = path_to if path.present?
    path_to = #result for calling last step in backpedal list
    
    link_to path_to, options, html_options do
      content = capture(&block)
    end
      
end


#  def link_to(name = nil, options = nil, html_options = nil, &block)
#   html_options, options, name = options, name, block if block_given?
#   options ||= {}
# 
#   html_options = convert_options_to_data_attributes(options, html_options)
# 
#   url = url_for(options)
#   html_options["href".freeze] ||= url
# 
#   content_tag("a".freeze, name || url, html_options, &block)
# end
