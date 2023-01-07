Rails.application.routes.draw do
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
# post '/admin/genres' => 'public/genres#create'
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

#管理者
 namespace :admin do
    root to: 'homes#top'
    # get '/admin/customers/:id' => 'costomers#show'
    # patch '/admin/customers/:id' => 'costomers#update', as: 'update_costomers'
    patch '/admin/customers/:id/edit' => 'customers#update', as: 'update_customer'
    patch '/admin/genres/:id/edit' => 'genres#update', as: 'update_genre'
    post 'genres' => 'genres#create'
    get 'genres/new'
    get 'genres' => 'genres#index'
    get '/admin/genres/:id/edit' => 'genres#edit', as: 'edit_genre'
    post 'items' => 'items#create'
    get 'items/new'
    get '/admin/items/:id/edit' => 'items#edit', as: 'edit_item'
    patch '/admin/items/:id/edit' => 'items#update', as: 'update_item'
    get 'items' => 'items#index'
    delete 'admins' => 'sessions#destroy', as: 'destroy'
    resources :items, only: [:show, :index, :new, :create, :edit, :update, :image]
    resources :customers, except: [:new, :create, :destroy]
    resources :genres, except: [:show, :destroy, :new]
    resources :order_items, only: [:update]
    resources :orders, only: [:index, :show, :update] do

    end
  end

#顧客
    root to: 'public/customers#show'
    # root to: 'public/homes#top'

    get '/about' => 'public/homes#about', as: 'about'
    get '/' => 'public/homes#top'


    # resources :customers, only: [:edit, :show,:update]
    get '/cart_items' => 'public/cart_items#index'
    get '/customers/information/edit' => 'public/customers#edit' ,as: 'edit_customer'
    patch '/customers/information/edit' => 'public/customers#edit', as: 'update_customer'
    get '/customers/my_page' => 'public/customers#show'
    get	'/customers/sign_up' => 'public/registrations#new'
    # devise_for :customers
    delete '/customers/sign_out' => 'public/sessions#destroy'
    get '/customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw' => 'public/customers#withdrawal', as: 'withdrawal'

    get '/items' => 'public/items#index'
    get 'items/:id' => 'public/items#show'


    # post 'items' => 'public/items#show'


    get 'cart_items' => 'public/cart_items#index'
    post '/cart_items' => 'public/cart_items#create'
    patch '/cart_items/:id' => 'public/cart_items#update'
    delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'
    get '/cart_items/:id' => 'public/cart_items#index', as: 'cart_item'

    # get 'cart_items' => 'cart_items#new'

    # patch 'cart_items' => 'public/customers#', as: 'withdrawal'

    get 'orders/new' => 'public/orders#new'
    post 'orders/confirm' => 'public/orders#confirm'
    get 'orders/complete' => 'public/orders#complete'
    get 'orders/:id' => 'public/orders#show'
    get 'orders' => 'public/orders#index'
    post 'orders' => 'public/orders#create'


    resources :addresses, except: [:new, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy, :destroy_all]
    resources :orders,only: [:create, :index, :show, :new] do
      collection do
        get 'complete'
        post 'confirm'
      end
    end
namespace :public do
    root to: 'public/customers#show'
    resources :cart_items, only: [:index, :create, :update, :destroy,:destroy_all] do
      collection do
        delete 'destroy_all'
      end

    end

    resources :items, only: [:index, :show]
    # get	'/customers/sign_up' => 'public/registrations#new'



      # get 'unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
      # patch 'withdraw' => 'customers#withdraw', as: 'withdraw'
      # resource :customers, only: [:show]
      # put 'update' => 'customers#update'
      # patch 'update' => 'customers#update'
      # get 'edit' => 'customers#edit'
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end