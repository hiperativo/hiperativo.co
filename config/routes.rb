Hiperativo::Application.routes.draw do
	devise_for :users
	resources :users

	constraints subdomain: "impulso" do
		# resources :impulsos, path: "/"
		resources :impulsos
	end

	root to: redirect(subdomain: "impulso"), constraints: {subdomain: ""}
end