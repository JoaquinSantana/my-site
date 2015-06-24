module ProjectsHelper
  def foto(project)
    case project
    when "spolisty.com"
      content_tag(:div, image_tag("spolisty.jpg", class: "laptop-content-bg"))
    when "Tiefenbach Polska'"
      image_tag("tief-mini.jpg")
    when "Netguru workshop"
      image_tag("workshop.jpg")
    when "Make it"
      image_tag("workshop.jpg")
    end
  end
end
