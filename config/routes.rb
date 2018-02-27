Rails.application.routes.draw do
	  

	# Devise LoanManager Account
  	devise_for :loan_managers, path:'loan_managers', controllers:
  	{
  		registrations: 	'loan_managers/registrations',
  		sessions: 		'loan_managers/sessions',
  		confirmations: 	'loan_managers/confirmations',
  		passwords: 		'loan_managers/passwords',
  		unlocks: 		'loan_managers/unlocks'

  		# Not including omniauth because it's not enabled in the Admin Model
  		# ,omniauth_callbacks: 'loan_managers/omniauth_callbacks'
  	}



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
