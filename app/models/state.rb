class State < ApplicationRecord
    has_many :cities, dependent: :destroy
    
    def self.options_for_select
        []
    end
end
