Rails.application.routes.draw do
  root 'courses#index'
  get 'courses/new', to: 'courses#new'
  get 'pages/about', to: 'pages#about'
  resources :students, except: [:destroy]

  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'

  post 'course_enroll', to: 'student_courses#create'

end
