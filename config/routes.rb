Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :signups do
    resources :signups, :path => '', :only => [:new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :signups, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/signups" do
      resources :signups, :path => '' 
      resources :settings, :only => [:edit, :update]
    end
  end
end

