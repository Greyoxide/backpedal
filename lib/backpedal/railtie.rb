require 'rails'

module Backpedal
	class MyRailtie < Rails::Railtie
		initializer "backpedal.view_helper" do
			ActionView::Base.send :include, Backpedal.link
		end
	end
end