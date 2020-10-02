require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')


get('/') do
  
  @words = Word.all
  erb(:words)
end

get('/words') do
  
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

post('/words') do
  name = params[:word_name]
  word = Word.new(name, nil)
  word.save()
  @words = Word.all() # Adding this line will fix the error.
  erb(:words)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end


patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  @words = Word.all
  erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end

# Get the detail for a specific song such as lyrics and songwriters.
get ('/words/:id/definitions/:def_id') do 
  @definition = Definition.find(params[:def_id].to_i())
  erb :definition 
end

  # Post a new song. After the song is added, Sinatra will route to the view for the album the song belongs to.
post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  def1 = Definition.new(params[:song_name], @word.id, nil)
  def1.save()
  erb :word
end


# Edit a song and then route back to the album view.

patch ('/words/:id/definitions/:def_id') do 
  @word = Word.find(params[:id].to_i())
  def1 = Definition.find(params[:def_id].to_i())
  def1.update(params[:name], @word.id)
  erb(:word)
end

# Delete a song and then route back to the album view.
delete('/words/:id/definitions/:def_id') do
  def1 = Definition.find(params[:def_id].to_i())
  def1.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

