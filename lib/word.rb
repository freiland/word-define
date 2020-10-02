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
    @@albums.values()
  end