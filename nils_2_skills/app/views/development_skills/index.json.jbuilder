json.array!(@development_skills) do |development_skill|
  json.extract! development_skill, :id, :skill_name, :desired_skill_level, :notes, :completed, :percent_complete, :current_skill_level
  json.url development_skill_url(development_skill, format: :json)
end
