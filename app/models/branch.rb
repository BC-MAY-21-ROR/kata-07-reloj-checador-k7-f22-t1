# frozen_string_literal: true

class Branch < ApplicationRecord
  has_many :employees
end
