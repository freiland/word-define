class Definition 
  attr_reader :id
  attr_accessor :name, :word_id

  @@all_defs = {}
  @@total_rows = 0

  def initialize(name, word_id, id)
    @name = name
    @word_id = word_id 
    @id = id || @@total_rows += 1 
  end

  def ==(def_to_compare)
    (self.name() == def_to_compare.name()) && (self.word_id() == def_to_compare.word_id())
  end

  def self.all
    @@all_defs.values()
  end

  def save 
    @@all_defs[self.id] = Definition.new(self.name, self.word_id, self.id)
  end

  def self.find(id)
    @@all_defs[id]
  end

  def update(name, word_id)
    self.name = name 
    self.word_id = word_id 
    @@all_defs[self.id] = Definition.new(self.name, self.word_id, self.id)
  end

  def delete 
    @@all_defs.delete(self.id)
  end

  def self.clear 
    @@all_defs ={}
  end

  def self.find_by_word(wrd_id)
    defs = []
    @@all_defs.values.each do |deff|
      if deff.word_id == wrd_id
        defs.push(deff)
      end
    end
    defs
  end

  def word
    Word.find(self.word_id)
  end
end