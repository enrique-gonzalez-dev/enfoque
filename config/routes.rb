Rails.application.routes.draw do

  resources :applicant_reports
  resources :business_reports

  post 'create_business_report' => 'businesses#create_business_report'
  post 'create_applicant_report' => 'applicants#create_applicant_report'

  patch 'upload_report_img' => 'business_reports#upload_report_img'
  patch 'upload_payment_img' => 'business_reports#upload_payment_img'
  
  patch 'upload_applicant_report_img' => 'applicant_reports#upload_report_img'
  patch 'upload_applicant_payment_img' => 'applicant_reports#upload_payment_img'

  resources :applicants do
    collection do
      get 'catch_city'
    end
  end
  resources :admins

  resources :businesses do
    collection do
      get 'catch_city'
    end
  end
  patch 'upload_taxes_img' => 'businesses#upload_taxes_img'
  patch 'upload_internal_img' => 'businesses#upload_internal_img'
  patch 'upload_external_img' => 'businesses#upload_external_img'
  patch 'upload_proof_residency_img' => 'businesses#upload_proof_residency_img'
  patch 'upload_official_id_img' => 'businesses#upload_official_id_img'
  patch 'upload_official_back_id_img' => 'businesses#upload_official_back_id_img'
  patch 'upload_notarial_document_img' => 'businesses#upload_notarial_document_img'
  patch 'upload_agent_proof_img' => 'businesses#upload_agent_proof_img'
  patch 'upload_agent_selfie_img' => 'businesses#upload_agent_selfie_img'
  #feedback
  patch 'upload_feedback_1_img' => 'businesses#upload_feedback_1_img'
  patch 'upload_feedback_2_img' => 'businesses#upload_feedback_2_img'
  patch 'upload_feedback_3_img' => 'businesses#upload_feedback_3_img'
  patch 'upload_training_plan_img' => 'businesses#upload_training_plan_img'
  
  patch 'upload_applicant_feedback_1_img' => 'applicants#upload_applicant_feedback_1_img'
  patch 'upload_applicant_feedback_2_img' => 'applicants#upload_applicant_feedback_2_img'
  patch 'upload_applicant_feedback_3_img' => 'applicants#upload_applicant_feedback_3_img'
  patch 'upload_applicant_agreement_img' => 'applicants#upload_applicant_agreement_img'
  patch 'upload_applicant_management_payment_img' => 'applicants#upload_applicant_management_payment_img'

  #agreement
  patch 'upload_agreement_img' => 'businesses#upload_agreement_img'
  patch 'upload_advance_payment_img' => 'businesses#upload_advance_payment_img'
  patch 'upload_verified_business_img' => 'businesses#upload_verified_business_img'
  patch 'upload_settlement_payment_img' => 'businesses#upload_settlement_payment_img'

  
  patch 'upload_ine_id_img' => 'applicants#upload_ine_id_img'
  patch 'upload_cedule_id_img' => 'applicants#upload_cedule_id_img'
  patch 'upload_address_proof_img' => 'applicants#upload_address_proof_img'

  patch 'update_applicant_status' => 'applicants#update_applicant_status'
  patch 'update_status' => 'businesses#update_status'

  get 'registry_success' => 'businesses#registry_success'
  get 'registry_applicant_success' => 'applicants#registry_applicant_success'

  get 'admin_dashboard' => 'admins#dashboard'
  get 'admin_profile' => 'admins#profile'

  devise_for :users, controllers: { sessions: "sessions", registrations: "registrations"}

  devise_scope :user do
    post 'update_info', to: 'registrations#update_info'
  end

  #resources :users, :only => [] do
  resources :users do
    collection do
      post 'unsubscribe'
    end
  end

  get 'new_register' => 'businesses#new_business'
  get 'new_applicant_register' => 'applicants#new_applicant'


  get 'applicant_profile' => 'applicants#profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
end
