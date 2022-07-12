# == Route Map
#

Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :destroy]
    post "cart_items/cancel", as: "cancel"
    get "orders/completion", as: "completion"
    get "orders/:id/confirmation" => "orders#confirmation", as: "confirmation"
    resources :orders, only: [:new, :index, :show, :create]
  end

  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "/" => "homes#top"
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
    resources :items, only: [:new, :edit, :create, :update]
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
