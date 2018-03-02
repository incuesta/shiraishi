Rails.application.routes.draw do
	  
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
