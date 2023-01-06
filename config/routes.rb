Rails.application.routes.draw do
  
  post 'imc', to: 'imc#compute'
  post 'auths', to: 'auths#create'

end
