# frozen_string_literal: true

class Branch < ApplicationRecord
<<<<<<< HEAD
  validates :name, :address, presence: true
=======
  has_many :employees
>>>>>>> master
end
