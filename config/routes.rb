Rails.application.routes.draw do



  resources :events do
    resources :agenda_entries
    resources :speakers
    resources :sponsors
  end

  resources :cards
  resources :admins
  resources :categories
  resources :messages
  resources :boxes
  resources :galleries
  resources :certifications
  resources :newsletters
  resources :carousels
  resources :events
  resources :articles
  resources :abouts
  resources :contacts
  resources :faqs
  resources :links

  root 'static_pages#index'
  get 'static_pages/index'

  devise_scope :user do
    get "/login",  :to => "devise/sessions#new"
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'dashboard' => 'dashboard#index' # dashboard controller needs user authentication
  get 'certificates' => 'static_pages#certificates'
  get 'news' => 'static_pages#news'
  get 'entities' => 'static_pages#entities'
  get 'about' => 'static_pages#about'
  get 'search' => 'static_pages#search'
  get 'publications' => 'static_pages#publications'
  get 'contact' => 'static_pages#contact'
  get 'event' => 'static_pages#event'
  get 'statistics' => 'static_pages#statistics'
  get 'events_list' => 'static_pages#events_list'
  get 'multimedia' => 'static_pages#multimedia'
  get 'faq' => 'static_pages#faq'
end
