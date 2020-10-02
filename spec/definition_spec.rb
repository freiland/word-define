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

  #describe('.all') do 
    #it('returns a list of all definitions') do 
      #def1 = Definition.new("big", @word.id, nil)
      #def1.save()
      #def2 = Definition.new("small", @word.id, nil)
      #def2.save()
      #expect(Definition.all).to(eq([def1, def2]))
    #end
  #end
end