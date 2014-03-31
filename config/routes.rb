Demo::Application.routes.draw do
  mount RailsAdmin::Engine => '/demo/admin', as: :rails_admin
  mount Piggybak::Engine => '/demo/checkout', as: :piggybak
  mount PiggybakTaxonomy::Engine => '/demo', :as => 'piggybak_taxonomy'
  mount PiggybakCoupons::Engine => '/demo', :as => 'piggybak_coupons'
  mount PiggybakGiftcerts::Engine => '/demo', :as => 'piggybak_giftcerts'
  mount PiggybakBundleDiscounts::Engine => '/demo', :as => 'piggybak_bundle_discounts'

  devise_for :users, :path => '/demo/users'

  root 'home#index'
  get '/demo' => 'home#index'
  get '/demo/image/:id' => 'images#show', as: :image
  get '/demo/frame' => 'frames#show', as: :frame
  get '/demo/:slug' => 'pages#show'

  # match '*path' => 'home#index' 
end
