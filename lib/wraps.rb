require 'active_support/concern'
require 'wraps/version'
require 'wraps/base'

module Wraps
  extend ActiveSupport::Concern

  included do
    attr_accessor :wrapped_object
  end

  module ClassMethods
    def wraps(name, options = {})
      @wrapper = Wraps::Base.new(name, options)

      define_method name do
        self.wrapped_object
      end

      define_method "#{name}=" do |obj|
        self.wrapped_object = obj
      end
    end

    def find(id)
      new(:id => id)
    end

    def wrapper
      @wrapper
    end

    def method_missing(method_sym, *arguments, &block)
      # Try to call the method on the wrapped_object
      @wrapper.klass.send(method_sym, *arguments, &block)
    end
  end

  module InstanceMethods
    def initialize(attribs = {})
      @wrapped_object = attribs[:id] ? @wrapped_object = wrapper.find(attribs[:id]) : wrapper.new(attribs)
    end

    def wrapper
      self.class.wrapper
    end

    def method_missing(method_sym, *arguments, &block)
      # Try to call the method on the wrapped_object
      @wrapped_object.send(method_sym, *arguments, &block)
    end
  end
end
