json.array!(@answers) do |answer|
  json.extract! answer, :id, :text, :is_right, :question_id
  json.url answer_url(answer, format: :json)
end
