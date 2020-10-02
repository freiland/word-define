require 'rspec'
require 'word'

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe ('#save') do 
    it ('saves a word') do 
      word = Word.new('hi', nil)
      word.save()
      expect(Word.all).to(eq([word]))
    end 
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end


end