json.array!(@tasks) do |task|
  json.extract! task, :user_id, :client_id, :name, :description, :notes, :priority, :due_date, :rate
  json.url task_url(task, format: :json)
end
