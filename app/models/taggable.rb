class Taggable < ApplicationRecord
    belongs_to :gossip
    belongs_to :tag, optional: true
end
