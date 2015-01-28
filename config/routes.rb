Rails.application.routes.draw do

  scope '/admin' do
    resources :answers, :questions, :categories
  end

  get 'admin/' => 'admin#index'
  get 'start/' => 'game#index'
  get 'start/saveSettings' => 'game#saveSettings'
  get 'start/begin' => 'game#get_question'
  get 'start/begin/next' => 'game#next'
  get 'start/begin/end' => 'game#end'
  get 'start/begin/init' => 'game#init'
end
