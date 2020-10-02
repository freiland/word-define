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
end