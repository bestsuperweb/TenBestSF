Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/home', to: 'index#home'
  get '/about', to: 'index#about', as: 'about'
  get '/contact', to: 'index#contact', as: 'contact'
  get '/place', to: 'index#place', as: 'place'
  get '/ranking', to: 'index#ranking', as: 'ranking'

  root 'index#home'

end
