Hiperativo::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

	match ":action" => "pages"
	root :to => "pages#index"
end