Rails.application.routes.draw do
  # mount_roboto
  root 'champions#index'
  get 'search'     => 'champions#search'
  get 'admin'      => 'admins#index'
  get 'input_data' => 'admins#input_data'
  get 'champions'  => 'champions#index'
  get 'champions/:key'  => 'champions#show_skins'
  get 'champions/:key/:skin_name'  => 'champions#show_skin', :skin_name => /.*/
end
