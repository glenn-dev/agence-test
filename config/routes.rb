Rails.application.routes.draw do
  root 'performance#index'

  get 'relatorio', to: 'performance#relatorio', as: 'relatorio'
  get 'grafico', to: 'performance#grafico', as: 'grafico'
  get 'pizza', to: 'performance#pizza', as: 'pizza'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
