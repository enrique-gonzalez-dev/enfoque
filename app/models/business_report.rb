class BusinessReport < ApplicationRecord
    belongs_to :business
    has_one_attached :report_img
    has_one_attached :payment_img

    
end
