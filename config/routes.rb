Rails.application.routes.draw do
  root 'champions#index'
  get 'search'     => 'champions#search'
  get 'admin'      => 'admins#index'
  get 'input_data' => 'admins#input_data'
  get 'champions' =>  'champions#index'
end
