ServiceApi::Engine.routes.draw do

  controller 'plugins' do
  	get '/plugins', action: :index
  	post 'plugins', action: :create
  	get '/plugins/:id', action: :get_versions
  	put '/plugins/:id', action: :set_versions
  end

end
