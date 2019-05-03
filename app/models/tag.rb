class Tag < ApplicationRecord
    validates :title, presence: true

    has_many :taggables
    has_many :gossips, through: :taggables
end
