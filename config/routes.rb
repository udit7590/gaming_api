Rails.application.routes.draw do
  devise_for :vendors, controllers: {
    sessions: 'vendors/sessions',
    registrations: 'vendors/registrations',
    passwords: 'vendors/passwords',
    confirmations: 'vendors/confirmations'
  }, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }

  namespace :vendors do
    resource :environment, only: [:update]
  end

  namespace :gaming_vendor do
    resources :winning_rules
    resource :profile, only: [:show, :update]
    resource :account, only: [:show]
    resource :api, only: [:show, :update]
  end

  namespace :coupon_vendor do
    resources :coupons
    resource :profile, only: [:show, :update]
    resource :account, only: [:show]
  end

  # TODO:
  # 1. Ability to create gamers.
  # 2. Ability to send request for an achievement
  # 3. Ability to view all possible achievements and their coupon details
  # 4. The only way to secure the API is to send a callback hit to our gaming provider with gamer and coupon details. If gamer verifies, he can send the coupon. This must be a setting. Or gaming provider uses privileged key to access coupon.
      #  Other option is to make sure gaming provider can safely store a key. i.e. Apple KeyChain and Google's SharedPreferences are reliable.
      # https://stormpath.com/blog/the-ultimate-guide-to-mobile-api-security
  # 5. Ability to send push notifications (iOS, Android, Windows)
  # 6. Ability to crud winning_rules
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do

      resources :gamers, only: [:create, :index] do
        collection do
          # TODO: Should require privileged access
          put    :update
          # TODO: Should require privileged access
          delete :destroy
        end
      end

      # Actually it should be nested under `gamers` but for convinient urls, we will pass the info in `gamer request key` instead.
      resources :achievements, only: [:create, :index]

      # TODO: Should require privileged access except index
      resources :winning_rules, only: [:create, :index] do
        put    :update
        delete :destroy
      end
    end
  end

  root 'home#index'
end
