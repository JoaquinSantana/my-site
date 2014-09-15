module ApplicationHelper

  def flash_messages(opts={})
    @layout_flash = opts.fetch(:layout_flash) { true }
    capture do
      flash.each do |name, msg|
        case name
          when "success"
            "alert-success" # Green
          when "error"
           "alert-danger" # Red
          when "alert"
           "alert-warning" # Yellow
          when "notice"
           "alert-info" # Blue
          else
          name.to_s
        end
        concat content_tag(:div, msg, id: "flash_#{name}")
      end
    end
  end

  def show_layout_flash?
    @layout_flash.nil? ? true : @layout_flash
  end

  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success" # Green
      when "error"
       "alert-danger" # Red
      when "alert"
       "alert-warning" # Yellow
      when "notice"
       "alert-info" # Blue
      else
       flash_type.to_s
    end
  end

  def comments_tree_for(comments)
    comments.map do |comment, nested_comments|
      render(comment) +
          (nested_comments.size > 0 ? content_tag(:div, comments_tree_for(nested_comments), class: "replies") : nil)
    end.join.html_safe
  end
end
