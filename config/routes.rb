Rails.application.routes.draw do
  root to: 'temperatures#root'
  resource :temperatures
end
