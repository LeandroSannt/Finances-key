json.extract! transaction, :id, :name_transaction, :value, :date_transaction, :situation, :description, :category_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
