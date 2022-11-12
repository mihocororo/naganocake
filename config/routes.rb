Rails.application.routes.draw do

    get '/' => 'admin/homes#top'



  namespace :admin do
    get 'customers/index'
  end

  namespace :admin do
    get 'customers/show'
  end

  namespace :admin do
    get 'customers/edit'
  end

  namespace :admin do
    get 'customers/update'
  end

  namespace :admin do
    get 'order_items/update'
  end

  namespace :admin do
    get 'orders/show'
  end

  namespace :admin do
    get 'orders/update'
  end

  namespace :admin do
    get 'genres/index'
  end

  namespace :admin do
    get 'genres/create'
  end

  namespace :admin do
    get 'genres/edit'
  end

  namespace :admin do
    get 'genres/update'
  end

  namespace :admin do
    get 'items/index'
  end

  namespace :admin do
    get 'items/new'
  end

  namespace :admin do
    get 'items/create'
  end

  namespace :admin do
    get 'items/show'
  end

  namespace :admin do
    get 'items/edit'
  end

  namespace :admin do
    get 'items/update'
  end



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
  namespace :public do
    get 'addresses/index'
  end

  namespace :public do
    get 'addresses/edit'
  end

  namespace :public do
    get 'addresses/create'
  end

  namespace :public do
    get 'addresses/destroy'
  end

  namespace :public do
    get 'orders/new'
  end

  namespace :public do
    get 'orders/confirm'
  end

  namespace :public do
    get 'orders/complete'
  end

  namespace :public do
    get 'orders/create'
  end

  namespace :public do
    get 'orders/index'
  end

  namespace :public do
    get 'orders/show'
  end

  namespace :public do
    get 'cart_items/index'
  end

  namespace :public do
    get 'cart_items/update'
  end

  namespace :public do
    get 'cart_items/destroy'
  end

  namespace :public do
    get 'cart_items/destroy_all'
  end

  namespace :public do
    get 'cart_items/create'
  end

  namespace :public do
    get 'sessions/new'
  end

  namespace :public do
    get 'sessions/create'
  end

  namespace :public do
    get 'sessions/destroy'
  end

  namespace :public do
    get 'registrations/new'
  end

  namespace :public do
    get 'registrations/create'
  end

  namespace :public do
    get 'items/index'
  end

  namespace :public do
    get 'items/show'
  end

  namespace :public do
    get 'homes/top'
  end

  namespace :public do
    get 'homes/about'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
