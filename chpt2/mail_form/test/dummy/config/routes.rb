Dummy::Application.routes.draw do
    resources :contact_forms. only: :create
    root to: "contact_forms#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
