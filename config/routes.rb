Rails.application.routes.draw do
	  


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
