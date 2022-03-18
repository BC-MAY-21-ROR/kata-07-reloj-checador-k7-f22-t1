class Branch < ApplicationRecord
    validates :name, :address, presence: true
end
