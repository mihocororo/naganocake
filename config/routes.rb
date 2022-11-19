Rails.application.routes.draw do
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
    resources :items, except: [:destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :genres, except: [:show, :destroy, :new]
    resources :orders, only: [:index, :show, :update] do
     resources :order_details, only: [:index, :update]
    end
  end

#顧客
    post '/admin/genres' => 'genres#create'
    get 'admin/:id/edit' => 'admin#edit', as: 'edit_list'
    get '/about' => 'public/homes#about', as: 'about'
    get '/' => 'public/homes#top'
    get '/items' => 'public/items#index'
    get	'/customers/sign_up' => 'public/registrations#new'
    resources :addresses, except: [:new, :show]

    resources :orders,only: [:create, :index, :show, :new] do
      collection do
        get 'complete'
        post 'confirm'
      end
    end

    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :items, only: [:index, :show]
    # get	'/customers/sign_up' => 'public/registrations#new'
    namespace :customers do
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