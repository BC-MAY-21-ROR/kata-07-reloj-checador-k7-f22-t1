# frozen_string_literal: true

class Branch < ApplicationRecord
  validates :name, :address, presence: true
  has_many :employees
  has_many :records
end
