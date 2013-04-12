

class Parser

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def parse
      # magic, don't touch son
      file = File.open(@filename).reject {|items| items == " \n" }.map { |word| word.chomp}.each_slice(2).map {|element| element}      
      Hash[file].each { |question, answer|  @stack << Card.new(question, answer) }
      @stack
  end
end



file = Parser.new('flashcard_samples.txt')

p file.parse


