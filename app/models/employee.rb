# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :branch
  belongs_to :role
  has_many :records
end
