require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/books.rb')
require_relative('./models/publishers.rb')
require_relative('./models/genres.rb')
require_relative('./models/videos.rb')

#index
get '/books' do
  @books = Book.all()
  erb(:"books/index")
end

#main index
get '/' do
  @books = Book.all_low()
  @videos = Video.all()
  erb(:index)
end

#new
get '/books/new' do
  @publishers = Publisher.all()
  @genres = Genre.all()
  erb(:"books/new")
end

#edit
get '/books/:id/edit' do
  @books = Book.find(params['id'].to_i())
  @publishers = Publisher.all()
  @genres = Genre.all()
  erb(:"books/edit")
end

#show
get '/books/:id' do
  @books = Book.find(params['id'].to_i())
  erb(:"books/info")
end

#save
post '/books' do
  book = Book.new(params)
  book.save()
  redirect to("/books")
end

#delete
post '/books/:id/delete' do
  book = Book.find(params['id'].to_i())
  book.delete()
  redirect to("/books")
end

#update
post '/books/:id' do
  book = Book.new(params)
  book.update()
  redirect to("/books/#{params["id"]}")
end
