class State < ApplicationRecord
    has_many :cities, dependent: :destroy
    has_many :high_schools, dependent: :destroy
    has_many :universities, dependent: :destroy
    
    def self.options_for_select
        []
    end
end
