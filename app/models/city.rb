class City < ApplicationRecord
    belongs_to :state
    has_many :high_schools, dependent: :destroy
    has_many :universities, dependent: :destroy

    def self.options_for_select
        []
    end
end
