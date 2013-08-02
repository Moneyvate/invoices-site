json.array!(@contacts) do |contact|
  json.extract! contact, :contact_type_id, :name, :title, :email, :phone, :skype, :im
  json.url contact_url(contact, format: :json)
end
