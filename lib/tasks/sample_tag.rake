namespace :tags do
  desc "Generuj nowy tag"
  task populate: :environment do
    tag = Tag.new
    tag.losowy_tag
    tag.save
    puts "#{Time.now} - Success!"
  end
end
