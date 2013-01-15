ParasquidCs2014::Application.routes.draw do
  mount Redirector, at: '/'
  get '/admin', to: 'admin#index'
end
