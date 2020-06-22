module StackHelper
	def stack
		content_tag :ol do
			session[:tree].split(",").each do |path|
				concat content_tag :li, path
			end
		end
	end
end
