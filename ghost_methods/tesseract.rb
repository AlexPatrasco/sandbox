class Tesseract
  def method_missing(method, *args)
    if result = method.match(/^(deposit|take)_([a-z]*)/)
      action, good = result[1], result[2]
      unless self.class.method_defined? method
        self.instance_variable_set("@#{good}", 0)

        self.class.class_eval do
          attr_reader good

          define_method "deposit_#{good}" do |quantity|
            raise "Should be Integer" unless quantity.is_a? Integer 
            self.instance_variable_set("@#{good}", self.public_send(good) + quantity)
          end

          define_method "take_#{good}" do |quantity|
            raise "Should be Integer" unless quantity.is_a? Integer
            raise "Not enough #{good}" if quantity > self.public_send(good)
            self.instance_variable_set("@#{good}", self.public_send(good) - quantity)
          end
        end
        return self.public_send(method, args[0]) if action == 'deposit'
        raise "You should deposit #{good} first!" if action == 'take'
      end
    else
      super
    end
  end
end