Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/surgeries", to: "surgeries#index"
  get '/surgeries/:id', to: 'surgeries#show'
  post '/surgeries/:id/doctors', to: 'surgery_doctors#create'
 
end
