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

  describe('.all') do 
    it('returns a list of all definitions') do 
      def5 = Definition.new("test33", @word.id, nil)
      def5.save()
      def22 = Definition.new("44test", @word.id, nil)
      def22.save()
      expect(Definition.all).to(eq([def5, def22]))
    end
  end

  describe ('#save') do 
    it('saves a definition') do 
      def1 = Definition.new("testttt", @word.id, nil)
      def1.save()
      expect(Definition.all).to(eq([def1]))
    end
  end

  describe ('.find') do 
    it ('finds a definition by id') do 
      def1 = Definition.new("testt", @word.id, nil)
      def1.save()
      def2 = Definition.new("ama", @word.id, nil)
      def2.save()
      expect(Definition.find(def1.id)).to(eq(def1))
    end
  end
end