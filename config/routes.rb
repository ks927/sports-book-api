Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
      post 'auth/register', to: 'users#register'
      resources :sessions, :only => [:create]
    end
  end 
end
