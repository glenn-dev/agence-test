Rails.application.routes.draw do
  root 'performance#index'

  get 'get_data', to: 'performance#get_data', as: 'get_data'
  get 'relatorio', to: 'performance#relatorio', as: 'relatorio'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
