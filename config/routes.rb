Hiperativo::Application.routes.draw do
	match ":action" => "pages"
	root :to => "pages#index"
end