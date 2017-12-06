class Safe
  alias :old_missing :method_missing

  def method_missing(expression, *args)
    result = expression.match(/^(([a-z]|_)\w+)(=?)$/)
    return old_missing(expression, args) if result[1].nil?
    unless self.class.method_defined? result[1]
      self.class.class_eval do
        attr_accessor result[1]
      end
    end
    self.send(expression, args) if args && result[3] == "="
  end
end

safe = Safe.new
safe.skills = {magik: {spells: %w(abra cadabra)}}
puts safe