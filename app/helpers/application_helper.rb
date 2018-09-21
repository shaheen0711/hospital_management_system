# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def make_breadcrumb
    target_controller = controller.controller_path
    target_action = controller.action_name
    crumb_key = "#{target_controller.to_s}_#{target_action.to_s}"
    breadcrumb crumb_key.to_sym
  end

  def render_breadcrumbs
    breadcrumb :separator => '<div class = "bread-crumb-separator arrow">  >  </div>'.html_safe,
      :autoroot => true,:show_root_alone => false,:link_last => false
  end

end
