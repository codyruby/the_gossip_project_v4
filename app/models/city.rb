class City < ApplicationRecord
    validates :name, :zip_code, presence: true

    has_many :users
end
