require ('capybara/rspec')
require ('./app')
Capybara.app = Sinatra::Application 
set(:show_exceptions, false)



describe('create a word path', {:type => :feature}) do 
  it ("creates an word") do 
    visit('/')
    click_on ("add a new word")
    fill_in('word_name', :with => 'Capytest')
    click_on('add word')
    expect(page).to have_content('Capytest')
  end
end 

describe('create a definition path', {:type => :feature}) do 
  it ('creates a word and then goes to the word page') do 
    test_word = Word.new('HiSnead', nil)
    test_word.save
    visit("/words/#{test_word.id}")
    fill_in('def_name', :with => 'hobo man')
    click_on('add your definition')
    expect(page).to have_content('hobo man')
  end 
end 

