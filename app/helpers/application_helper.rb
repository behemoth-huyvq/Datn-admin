module ApplicationHelper
  include Pagy::Frontend

  def active_class(controller, action = nil)
    return "" unless controller_name == controller

    if action
      return "" unless action_name == action
    end

    "active"
  end

  def loading
    inner_options = {
      ref: "Loading",
    }

    content_tag("loading", nil, inner_options, false)
  end
end
