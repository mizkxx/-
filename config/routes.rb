Rails.application.routes.draw do
  get 'books/edit'
  get 'books/index'
  get 'books/show'
  get '/home' => 'booker#home'
  devise_for :users
  root 'users#show' #ログイン後リダイレクトするページを記載 user_path(current_user.id)
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:new, :create, :index, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
