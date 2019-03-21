require 'backpedal/version'
require 'backpedal/builder'
require 'backpedal/actions'
require 'backpedal/back_link_helper'

module Backpedal
  ActionView::Base.send :include, BackLinkHelper
  ActionController::Base.send :include, Actions
end
