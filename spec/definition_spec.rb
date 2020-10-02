require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do 

  before (:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Giants", nil)
    @word.save()
  end

  describe ('#==') do 
    it ('is the same definition if it has the same attributes as another definition') do
      def1 = Definition.new("big", @word.id, nil)
      def2 = Definition.new("big", @word.id, nil)
      expect(def1).to(eq(def2))
    end
  end
end