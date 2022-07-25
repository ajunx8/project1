class Moon < ApplicationRecord
    belongs_to :planet, :optional => true
end
