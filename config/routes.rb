Rails.application.routes.draw do
	  

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
