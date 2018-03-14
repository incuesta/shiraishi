Rails.application.routes.draw do


    # Reports
    resources :reports, only: [:show, :index] do
        collection do
            # loans report
            get :requested_loans
            get :approved_loans
            get :rejected_loans
            get :disbursed_loans
            get :undisbursed_loans
        end
    end





    resources :cr_entries, only: [:edit, :update]




    resources :dr_entries, only: [:edit, :update]




    # AccoutingEntry
    resources :accounting_entries do
        collection do
            get :show_all_loan_entries
            get :show_income_summary
        end
    end




    # ClientDoc
    resources :client_docs




    # LoanSearch, advance search routes
    resources :loan_searches




    # LoanInstallment
    resources :loan_installments do
      member do 
        patch :pay_installment
        patch :unpay_installment
        patch :write_a_note
      end
    end




    # LoanDoc
    resources :loan_docs



    # LoanType
    resources :loan_types




# # compute the installments to be made
#     match 'loans/compute_installments/:id', to: 'loans#compute_installments', via: :post




#     # Check when the Client Submitted a document
#     match 'loans/update_submitted_docs/:id', to: 'loans#update_submitted_docs', via: :patch




#     # Reject or accept a Loan
#     match 'loans/approve_the_loan/:id', to: 'loans#approve_the_loan', via: :patch
#     match 'loans/reject_the_loan/:id', to: 'loans#reject_the_loan', via: :patch




    # Loan Model
    resources :loans do
        collection do
          # return Loans based on status
          get :requested_loans
          get :approved_loans
          get :rejected_loans
          get :disbursed_loans
          get :undisbursed_loans


          # For Loan Disbursion
          get :approved_loans_for_disbursion
        end



        member do 
          # compute the installments to be made
          post :compute_installments


          # Check when the Client Submitted a document
          patch :update_submitted_docs


          # Reject or accept a Loan
          patch :approve_the_loan
          patch :reject_the_loan


          # Disburse the Loan
          patch :disburse_the_loan


          # loans#show_loan_disbursion
          get :show_loan_disbursion


          # loans#show_accounting_for_loan
          get :show_accounting_for_loan
        end
    end



    # For Activation of Client Accounts
    namespace :clients do
      resources :account_activations, only: [:index, :show, :edit, :update]
    end
    match 'clients/account_activations/:id', to: "clients/account_activations#update", via: :post






    # Profile - Client
    resources :client_profiles
    
    # Devise Client Account
    devise_for :clients, path: 'clients', controllers:
    {
      registrations:  'clients/registrations',
      sessions:     'clients/sessions',
      confirmations:  'clients/confirmations',
      passwords:    'clients/passwords',
      unlocks:    'clients/unlocks'

      # Not including omniauth because it's not enabled in the clients Model
      # ,omniauth_callbacks: 'clients/omniauth_callbacks'
    }





    # Profile - Accountant
    resources :accountant_profiles

    # Devise Acountant Account
    devise_for :accountants, path: 'accountants', controllers:
    {
      registrations:  'accountants/registrations',
      sessions:     'accountants/sessions',
      confirmations:  'accountants/confirmations',
      passwords:    'accountants/passwords',
      unlocks:    'accountants/unlocks'

      # Not including omniauth because it's not enabled in the accountants Model
      # ,omniauth_callbacks: 'accountants/omniauth_callbacks'
    }




    # Profle - Loan Manager
    resources :loan_manager_profiles

    # Devise LoanManager Account
  	devise_for :loan_managers, path:'loan_managers', controllers:
  	{
  		registrations: 	'loan_managers/registrations',
  		sessions: 		'loan_managers/sessions',
  		confirmations: 	'loan_managers/confirmations',
  		passwords: 		'loan_managers/passwords',
  		unlocks: 		'loan_managers/unlocks'

  		# Not including omniauth because it's not enabled in the LoanManager Model
  		# ,omniauth_callbacks: 'loan_managers/omniauth_callbacks'
  	}




    # Profile - Admin
  	resources :admin_profiles

    # Devise Admin Account
  	devise_for :admins, path: 'admins', controllers: 
  	{
  		registrations: 	'admins/registrations',
  		sessions: 		'admins/sessions',
  		confirmations: 	'admins/confirmations',
  		passwords: 		'admins/passwords',
  		unlocks: 		'admins/unlocks'

  		# Not including omniauth because it's not enabled in the Admin Model
  		# ,omniauth_callbacks: 'admins/omniauth_callbacks'
  	}




    # Article
  	resources :articles
	


  	# Static Pages
  	get 'pages/services'
  	get 'pages/articles'
  	get 'pages/organization'
  	get 'pages/about'
  	get 'pages/contacts'
  	get 'pages/help'


	 # Root
	 root 'pages#home'
end
