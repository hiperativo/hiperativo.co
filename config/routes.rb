Hiperativo::Application.routes.draw do
	get "maintenance" => "errors#maintenance"
	get "blog" => "posts#index"
	root :to => "pages#index"

end