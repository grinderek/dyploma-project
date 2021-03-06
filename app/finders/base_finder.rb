# frozen_string_literal: true

class BaseFinder
  def self.respond_to_missing?(name, *args)
    !name.nil? || super
  end

  def self.method_missing(name, *args, &block)
    new(model.all).send(name, *args, &block)
  end

  def self.model(klass = nil)
    if klass
      @model = klass
    else
      @model
    end
  end

  def initialize(scope)
    @scope = scope
  end

  def paginate(page)
    scope.paginate(page: page)
  end

  private

  attr_reader :scope

  def new(*args)
    self.class.new(*args)
  end
end
