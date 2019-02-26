Rails.application.routes.draw do

  get 'candidates/character_info' => 'candidates#character_info'
  get 'candidates/result' => 'candidates#result'
  resources :candidates do
    member do
      post :vote
      post :picture
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
