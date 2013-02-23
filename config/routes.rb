Hiperativo::Application.routes.draw do
	get "maintenance" => "errors#maintenance"
	get "about" => "persons#index"
	match ":action" => "pages"
	root :to => "persons#index"
end