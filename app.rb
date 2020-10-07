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
  #erb(:words)
  erb :words
end


get ('/words/:id/definitions/:def_id') do 
  @definition = Definition.find(params[:def_id].to_i())
  #erb :definition 
  erb :definition
end

  
post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  def1 = Definition.new(params[:def_name], @word.id, nil)
  def1.save()
  erb :word
  # if (params[:def_names])
  #   def1 = Definition.new(params[:def_name], @word.id, nil)
  #   def1.save()
  #   erb :word
  # else
  #   erb :error
  # end
end




patch ('/words/:id/definitions/:def_id') do 
  @word = Word.find(params[:id].to_i())
  def1 = Definition.find(params[:def_id].to_i())
  def1.update(params[:name], @word.id)
  erb(:word)
end


delete('/words/:id/definitions/:def_id') do
  def1 = Definition.find(params[:def_id].to_i())
  def1.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

