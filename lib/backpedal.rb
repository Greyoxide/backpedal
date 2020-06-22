require 'backpedal/version'
require 'backpedal/builder'
require 'backpedal/actions'
require 'backpedal/helpers/back_link_helper'
require 'backpedal/helpers/stack_helper.rb'

module Backpedal
  ActionView::Base.send :include, BackLinkHelper
	ActionView::Base.send :include, StackHelper
  ActionController::Base.send :include, Actions
end
