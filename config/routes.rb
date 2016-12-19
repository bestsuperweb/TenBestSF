Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/home', to: 'index#home'
  get '/about', to: 'index#about', as: 'about'
  get '/contact', to: 'index#contact', as: 'contact'
  get '/Top :category/:company', to: 'index#place', as: 'place'
  get '/Top :category', to: 'index#ranking', as: 'ranking'
  get '/search', to: 'index#search', as: 'search'
  get '/shareup/:id', to: 'index#share_up', as: 'shareup'
  get '/likeup/:id', to: 'index#like_up', as: 'likeup'
  get '/creat', to: 'index#creat'

  scope 'admin' do
    resources :companies
  end

  root 'index#home'

end
