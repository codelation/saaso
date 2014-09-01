Saaso::Engine.routes.draw do
  devise_for :users, class_name: "Saaso::User"
end
