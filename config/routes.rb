Rails.application.routes.draw do
  post 'candidates/character_info' => 'candidates#character_info'
  get 'candidates/c_new' => 'candidates#c_new'
  get 'candidates/character_info' => 'candidates#character_info'
  get 'candidates/guitargirl' => 'candidates#guitargirl'
  get 'candidates/schoolboy' => 'candidates#schoolboy'
  get 'candidates/tsunderegirl' => 'candidates#tsunderegirl'

  get 'candidates/result' => 'candidates#result'
  resources :candidates do
    member do
      post :vote
      post :picture
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
