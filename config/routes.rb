Hiperativo::Application.routes.draw do

	ActiveAdmin.routes(self)

	devise_for :admin_users, ActiveAdmin::Devise.config
	get "maintenance" => "errors#maintenance"
	match ":action" => "pages"
	root :to => "pages#index"
end