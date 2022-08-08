# require 'backpedal/version'
# require 'backpedal/builder'
# require 'backpedal/actions'
# require 'backpedal/helpers/back_link_helper'
# require 'backpedal/helpers/stack_helper.rb'

# module Backpedal
# 	ActionView::Base.send :include, BackLinkHelper
# 	ActionView::Base.send :include, StackHelper
# 	ActionController::Base.send :include, Actions
# end


# ActiveSupport.on_load(:active_record) do
#   extend Backpedal::Connection
# end

module Backpedal
  class << self
    attr_accessor :skipped_verbs
  end

  def self.configure(&block)
    yield self
  end
end


require_relative 'backpedal/version'
require_relative 'backpedal/actions'
require_relative 'backpedal/helpers/back_link_helper'
require_relative 'backpedal/railtie'