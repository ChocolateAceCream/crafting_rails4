Rails.application.routes.draw do
      get "cms/*page", to: "cms#respond"
    resources :users
    resources :sql_templates
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
