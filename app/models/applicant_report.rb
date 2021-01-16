class ApplicantReport < ApplicationRecord
    belongs_to :applicant
    has_one_attached :report_img
    has_one_attached :payment_img
end
