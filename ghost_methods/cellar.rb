class Cellar
  attr_reader :potatoes, :pickle_jars, :wine

  def initialize
    @potatoes = @pickles = @wine = 0
  end

  def deposit_potatoes(kilos)
    raise "Should be Integer" unless kilos.is_a? Integer
    @potatoes += kilos
  end

  def take_potatoes(kilos)
    raise "Should be Integer" unless kilos.is_a? Integer
    raise "Not enough potatoes" if kilos > @potatoes
    @potatoes -= kilos
  end

  def deposit_pickles(jars)
    raise "Should be Integer" unless jars.is_a? Integer
    @pickles += jars
  end

  def take_pickles(jars)
    raise "Should be Integer" unless jars.is_a? Integer
    raise "Not enough pickles" if jars > @pickles
    @pickles -= jars
  end

  def deposit_wine(bottles)
    raise "Should be Integer" unless bottles.is_a? Integer
    @wine += bottles
  end

  def take_wine(bottles)
    raise "Should be Integer" unless bottles.is_a? Integer
    raise "Not enough wine" if bottles > @wine
    @wine -= bottles
  end
end