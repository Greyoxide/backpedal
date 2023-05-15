require 'backpedal/version'
require 'backpedal/builder'
require 'backpedal/actions'
require 'backpedal/helpers/back_link_helper'
require 'backpedal/helpers/stack_helper'

module Backpedal
  class Engine < ::Rails::Engine
  end

  ActionView::Base.include BackLinkHelper
  ActionView::Base.include StackHelper
  ActionController::Base.include Actions
end
