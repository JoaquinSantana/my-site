json.array!(@projects) do |project|
  json.extract! project, :id, :name, :short_desc, :description, :site, :foto
  json.url project_url(project, format: :json)
end
