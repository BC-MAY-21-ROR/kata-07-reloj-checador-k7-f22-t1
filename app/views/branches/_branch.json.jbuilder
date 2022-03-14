# frozen_string_literal: true

json.extract! branch, :id, :name, :address, :created_at, :updated_at
json.url branch_url(branch, format: :json)
