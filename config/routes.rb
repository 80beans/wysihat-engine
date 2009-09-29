ActionController::Routing::Routes.draw do |map|
  
  map.resources :wysihat_files, :only => [:index, :create]

end
