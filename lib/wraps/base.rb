class Wraps::Base
  attr_reader :name, :klass

  def initialize(name, options = {})
    @name = name
    @klass = options[:class] || name.classify.constantize
  end

  def find(id)
    @klass.find(id)
  end

  def new(attribs = {})
    @klass.new(attribs)
  end
end
