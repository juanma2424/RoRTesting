class Employee < ApplicationRecord
    validates :name, :lastname, :address, :phone, :salary, presence: true
    validates :salary, numericality: { only_integer: true }
end
