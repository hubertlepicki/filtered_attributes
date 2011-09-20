Dummy::Application.routes.draw do
  resources :basic_filters
  resources :advanced_filters do
    collection do
      post :foo
    end
  end
end
