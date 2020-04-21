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
    options = {
      ref: "loading",
    }

    content_tag("loading", nil, options, false)
  end
end
