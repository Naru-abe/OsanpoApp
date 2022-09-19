Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # ゲストユーザー用
  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 会員側
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'search' => 'searches#search', as: 'search'
    get 'searchstation' => 'posts#searchstation', as: 'searchstation'
    resources :posts do
      resource :favorite, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    get 'end_users/unsubscribe' => 'end_users#unsubscribe'
    patch 'end_users/withdraw' => 'end_users#withdraw'
    resources :end_users, only: [:index, :show, :edit, :update] do
      get :favorites, on: :collection
    end
  end

  # 管理者側
  namespace :admin do
    get 'post_comments' => 'post_comments#index', as: 'post_comments'
    resources :posts, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:show, :destroy]
    end
    resources :tags, except: [:new, :show]
    resources :end_users, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
