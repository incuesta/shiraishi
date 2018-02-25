Rails.application.routes.draw do
	  

	  root 'pages#home'


	  # Static Pages
	  get 'pages/services'
	  get 'pages/articles'
	  get 'pages/organization'
	  get 'pages/about'
	  get 'pages/contacts'
	  get 'pages/help'


end
