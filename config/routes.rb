# == Route Map
#
#                           Prefix Verb     URI Pattern                             Controller#Action
#                 new_user_session GET      /users/sign_in(.:format)                devise/sessions#new
#                     user_session POST     /users/sign_in(.:format)                devise/sessions#create
#             destroy_user_session DELETE   /users/sign_out(.:format)               devise/sessions#destroy
# user_facebook_omniauth_authorize GET|POST /users/auth/facebook(.:format)          users/omniauth_callbacks#passthru
#  user_facebook_omniauth_callback GET|POST /users/auth/facebook/callback(.:format) users/omniauth_callbacks#facebook
#                new_user_password GET      /users/password/new(.:format)           devise/passwords#new
#               edit_user_password GET      /users/password/edit(.:format)          devise/passwords#edit
#                    user_password PATCH    /users/password(.:format)               devise/passwords#update
#                                  PUT      /users/password(.:format)               devise/passwords#update
#                                  POST     /users/password(.:format)               devise/passwords#create
#         cancel_user_registration GET      /users/cancel(.:format)                 devise/registrations#cancel
#            new_user_registration GET      /users/sign_up(.:format)                devise/registrations#new
#           edit_user_registration GET      /users/edit(.:format)                   devise/registrations#edit
#                user_registration PATCH    /users(.:format)                        devise/registrations#update
#                                  PUT      /users(.:format)                        devise/registrations#update
#                                  DELETE   /users(.:format)                        devise/registrations#destroy
#                                  POST     /users(.:format)                        devise/registrations#create
#                             root GET      /                                       pages#home
#                           groups POST     /groups(.:format)                       groups#create
#                        new_group GET      /groups/new(.:format)                   groups#new
#                            meals GET      /meals(.:format)                        meals#index
#                                  POST     /meals(.:format)                        meals#create
#                         new_meal GET      /meals/new(.:format)                    meals#new
#                        edit_meal GET      /meals/:id/edit(.:format)               meals#edit
#                             meal GET      /meals/:id(.:format)                    meals#show
#                                  PATCH    /meals/:id(.:format)                    meals#update
#                                  PUT      /meals/:id(.:format)                    meals#update
#                                  DELETE   /meals/:id(.:format)                    meals#destroy
#

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :groups do
    get 'users', defaults: { format: :json }
  end

  resources :meals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
