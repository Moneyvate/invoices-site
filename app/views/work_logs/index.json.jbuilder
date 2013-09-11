json.array!(@work_logs) do |work_log|
  json.extract! work_log, :task_id, :start_date, :start_time, :end_date, :end_time, :hours
  json.url work_log_url(work_log, format: :json)
end
