# frozen_string_literal: true

# Module that check errors
module Check
  def empty?(*_variables)
    _variables.each { |variable| raise EmptyError, "#{variable} is empty!" if variable.nil? }
  end

  def positive?(*_variables)
    _variables.each { |variable| raise InputError, "#{variable} is negative!" if variable.negative? }
  end

  def string?(*_variables)
    _variables.each { |variable| raise TypeError, "#{variable} isn't string!" unless variable.is_a? String }
  end

  def integer?(*_variables)
    _variables.each { |variable| raise TypeError, "#{variable} isn't integer!" unless variable.is_a? Integer }
  end

  # frozen_string_literal: true

  # EmptyStringError event
  class EmptyError < StandardError
    def initialize(message)
      super
    end
  end

  # frozen_string_literal: true

  # TypeError event
  class TypeError < StandardError
    def initialize(message)
      super
    end
  end

  # frozen_string_literal: true

  # EmptyStringError event
  class InputError < StandardError
    def initialize(message)
      super
    end
  end
end
