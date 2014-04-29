json.array!(@contacts) do |contact|
  json.extract! contact, :id, :email, :firstname, :lastname, :phone, :title
  json.url contact_url(contact, format: :json)
end
