Rails.application.routes.draw do
  get '/api/stories', to: 'story#index'
  post '/api/stories', to: 'story#create'
  get '/api/stories/:story_id/pages/:page_id', to: 'page#show'
  post '/api/stories/:story_id/pages/:parent_id/next', to: 'page#create'
end
