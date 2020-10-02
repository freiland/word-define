class Word
  attr_reader :id, :name 
  attr_accessor :name
  @@all_words = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name 
    @id || @@total_rows += 1
  end

  def self.all
    @@all_words.values()
  end

  def save
    @@all_words[self.id] = Word.new(self.name, self.id)
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.clear
    @@all_words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@all_words[id]
  end

  def update(name)
    self.name = name
    @@all_words[self.id] = Word.new(self.name, self.id)
  end

  def delete()
    @@all_words.delete(self.id)
  end

  def definitions
    Definition.find_by_word(self.id)
  end
end