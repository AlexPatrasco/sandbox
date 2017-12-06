class Cellar
  attr_reader :potatoes, :pickle_jars, :apples

  def initialize
    @potatoes = @pickles = @wine = 0
  end

  def deposit_potatoes(kilos)
    @potatoes += kilos
  end

  def take_potatoes(kilos)
    raise "Not enough potatoes" if kilos > @potatoes
    @potatoes -= kilos
  end

  def deposit_pickles(jars)
    @pickles += jars
  end

  def take_pickles(jars)
    raise "Not enough pickles" if jars > @pickles
    @pickles -= jars
  end

  def deposit_wine(bottles)
    @wine += bottles
  end

  def take_wine(bottles)
    raise "Not enough wine" if bottles > @wine
    @wine -= bottles
  end
end