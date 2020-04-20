Rails.application.routes.draw do

  get 'relatorio', to: 'performance#relatorio', as: 'relatorio'

  root 'performance#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
