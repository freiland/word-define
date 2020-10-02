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

  describe('.clear') do
    it("clears all words") do
      word = Word.new("bye bye", nil)
      word.save()
      
      Word.clear()
      
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new("hi", nil)
      word2 = Word.new("hi", nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.find') do
    it("finds an word by id") do
      word = Word.new("tops", nil)
      word.save()
      word2 = Word.new("black", nil)
      word2.save()
      expect(Word.find(word2.id)).to(eq(word2))
    end
  end

  describe('#update') do
    it("updates an word by id") do
      word = Word.new("time", nil)
      word.save()
      word.update("love")
      expect(word.name).to(eq("love"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new("tops", nil)
      
      word.save()
      
      word.delete()
      expect(Word.all).to(eq([]))
    end
  end

  describe('#definitions') do
    it("returns a words definitions") do
      Word.clear()
      word_test = Word.new("BIGGER", nil)
      word_test.save()
      def3 = Definition.new("ting", word_test.id, nil)
      def3.save()
      def4 = Definition.new("nottyting", word_test.id, nil)
      def4.save()
      expect(word_test.defs).to(eq([def3, def4]))
    end
  end


end