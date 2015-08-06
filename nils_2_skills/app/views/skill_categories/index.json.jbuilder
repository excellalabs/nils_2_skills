json.array!(@skill_categories) do |skill_category|
  json.extract! skill_category, :id
  json.url skill_category_url(skill_category, format: :json)
end
