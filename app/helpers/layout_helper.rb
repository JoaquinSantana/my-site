module LayoutHelper
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
end