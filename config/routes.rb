Rails.application.routes.draw do

get '/students', to: 'students#index'
get '/students/:id', to: 'students#show'

get '/courses', to: 'courses#index'

end
