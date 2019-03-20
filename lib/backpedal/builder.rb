module Backpedal
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    def reset
      self.configuration = Configuration.new
    end
  end
end

class Configuration
  attr_accessor :skipped_verbs

  def initialize
    @skipped_verbs = ['new', 'edit', 'destroy']
  end
end
