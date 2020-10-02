require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do 

  before (:each) do
    Word.clear()
    Definition.clear()
    @word1 = Word.new("Giants", nil)
    @word1.save()
  end

  describe ('#==') do 
    it ('is the same definition if it has the same attributes as another definition') do
      def1 = Definition.new("big", @word1.id, nil)
      def2 = Definition.new("big", @word1.id, nil)
      expect(def1).to(eq(def2))
    end
  end

  describe('.all') do 
    it('returns a list of all definitions') do 
      def5 = Definition.new("test33", @word1.id, nil)
      def5.save()
      def22 = Definition.new("44test", @word1.id, nil)
      def22.save()
      expect(Definition.all).to(eq([def5, def22]))
    end
  end
end