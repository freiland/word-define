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

  describe ('#update') do 
  it('updates a definition by id') do
    def1 = Definition.new("test", @word.id, nil)
      def1.save()
      def1.update("no", @word.id)
      expect(def1.name).to(eq("no"))
    end
  end

  describe ('#delete') do 
    it ('deletes a definition by id') do 
      def1 = Definition.new("testt", @word.id, nil)
      def1.save()
      def2 = Definition.new("ama", @word.id, nil)
      def2.save()
      def1.delete()
      expect(Definition.all).to(eq([def2]))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for a word") do
      word = Word.new("Blue", nil)
      word.save()
      def1 = Definition.new("color", word.id, nil)
      def1.save()
      def2 = Definition.new("sound", 6 , nil)
      def2.save()
      expect(Definition.find_by_word(word.id)).to(eq([def1]))
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      def1 = Definition.new("hey", @word.id, nil)
      def1.save()
      expect(def1.word()).to(eq(@word))
    end
  end



end