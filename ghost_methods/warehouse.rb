class Warehouse
  GOODS = %w(potatoes pickles wine apples onions cabbages).freeze

  attr_reader *GOODS

  def initialize
    GOODS.map { |good| "@#{good}" }.each do |good|
      self.instance_eval("#{good}=0")
    end
  end

  GOODS.each do |good|
    define_method "deposit_#{good}" do |quantity|
      raise "Should be Integer" unless quantity.is_a? Integer
      self.instance_eval("@#{good} += #{quantity}")
    end

    define_method "take_#{good}" do |quantity|
      raise "Should be Integer" unless quantity.is_a? Integer
      raise "Not enough #{good}" if quantity > self.public_send(good)
      self.instance_eval("@#{good} -= #{quantity}")
    end
  end
end
