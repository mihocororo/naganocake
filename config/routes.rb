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
    # patch 'lists/:id' => 'lists#update', as: 'update_list'
    patch '/admin/genres/:id/edit' => 'genres#update', as: 'update_genre'
    post 'genres' => 'genres#create'
    get 'genres/new'
    get 'genres' => 'genres#index'
    get '/admin/genres/:id/edit' => 'genres#edit', as: 'edit_genre'
    post 'items' => 'items#create'
    get 'items/new'
    patch '/admin/items/:id/edit' => 'items#update', as: 'update_item'
    get 'items' => 'items#index'
    delete 'admins' => 'sessions#destroy', as: 'destroy'
    resources :items, only: [:show, :index, :new, :create, :edit, :update, :image]
    resources :customers, except: [:new, :create, :destroy]
    resources :genres, except: [:show, :destroy, :new]
    resources :orders, only: [:index, :show, :update] do
     resources :order_details, only: [:index, :update]
    end
  end

#顧客

    # root to: 'public/homes#top'
    get '/customers/my_page' => 'public/customers#show'
    get '/about' => 'public/homes#about', as: 'about'
    get '/' => 'public/homes#top'
    get '/items' => 'public/items#index'
    get	'/customers/sign_up' => 'public/registrations#new'
    delete '/customers/sign_out' => 'public/sessions#destroy'
    resources :addresses, except: [:new, :show]

    resources :orders,only: [:create, :index, :show, :new] do
      collection do
        get 'complete'
        post 'confirm'
      end
    end
namespace :customers do
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :items, only: [:index, :show]
    # get	'/customers/sign_up' => 'public/registrations#new'

      # root to: 'public/homes#top'

      # get 'unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
      # patch 'withdraw' => 'customers#withdraw', as: 'withdraw'
      # resource :customers, only: [:show]
      # put 'update' => 'customers#update'
      # patch 'update' => 'customers#update'
      # get 'edit' => 'customers#edit'
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end