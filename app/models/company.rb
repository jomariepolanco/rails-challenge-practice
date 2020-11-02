class Company < ApplicationRecord
    has_many :offices
    has_many :employees
    has_many :buildings, through: :offices 

    validates :name, presence: true 
end
