Rails.application.routes.draw do
resources :flats 
  delete :delete_selected, on: :collection
end
