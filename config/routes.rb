Hiperativo::Application.routes.draw do
  get "comentarios/create"
  get "comentarios/destroy"
  mount Ckeditor::Engine => '/ckeditor'
	devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
	resources :users

	constraints subdomain: "impulso" do
		get "/admin", to: redirect("/users/sign_in")
		resources :impulsos, path: "/" do
			resources :comentarios
		end
	end

	root to: redirect(subdomain: "impulso"), constraints: {subdomain: ""}
end