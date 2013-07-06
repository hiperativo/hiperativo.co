Hiperativo::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
	devise_for :users
	resources :users


	constraints subdomain: "impulso" do
		get "/admin", to: redirect("/users/sign_in")
		resources :impulsos, path: "/"
		resources :impulsos
	end

	root to: redirect(subdomain: "impulso"), constraints: {subdomain: ""}
end