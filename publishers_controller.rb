require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/books.rb')
require_relative('../models/publishers.rb')

#index
get '/publishers' do
  @publishers = Publisher.all()
  erb(:"publishers/index")
end

#new
get '/publishers/new' do
  erb(:"publishers/new")
end

#edit
get '/publishers/:id/edit' do
  @publishers = Publisher.find(params['id'].to_i())
  erb(:"publishers/edit")
end

#show
get '/publishers/:id' do
  @publishers = Publisher.find(params['id'].to_i())
  erb(:"publishers/info")
end

#save
post '/publishers' do
  publisher = Publisher.new(params)
  publisher.save()
  redirect to ("/publishers")
end

#delete
post '/publishers/:id/delete' do
  publisher = Publisher.find(params['id'].to_i())
  publisher.delete()
  redirect to("/publishers")
end

#update
post '/publishers/:id' do
  publisher = Publisher.new(params)
  publisher.update()
  redirect to("/publishers/#{params["id"]}")
end
