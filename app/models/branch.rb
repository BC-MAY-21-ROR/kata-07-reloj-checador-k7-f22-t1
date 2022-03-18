# frozen_string_literal: true

class Branch < ApplicationRecord
  validates :name, :address, presence: true
end
