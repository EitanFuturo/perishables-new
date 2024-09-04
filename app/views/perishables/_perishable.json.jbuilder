json.extract! perishable, :id, :name, :start_date, :expiration_date, :created_at, :updated_at
json.url perishable_url(perishable, format: :json)
