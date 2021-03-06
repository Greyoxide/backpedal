module Actions

  if Backpedal.configuration.blank?
    @@skipped_verbs = ['new', 'edit', 'delete', 'destroy']
  else
    @@skipped_verbs = Backpedal.configuration.skipped_verbs
  end

  extend ActiveSupport::Concern

  def capture_path
    session[:tree] = url_for(root_path) if session[:tree].blank?

    tree = session[:tree].split(",")
    previous_page = request.referer
    current_page = request.original_url

    if tree.last == current_page
      # remove this page from the stack if the user was just here(clicked back link)
      tree.pop
      session[:tree] = tree.join(",")
    elsif request.referer.present? and request.referer != tree.last and @@skipped_verbs.exclude? request.referer.split("/").last.split("?")[0]
      tree << previous_page
      session[:tree] = tree.join(",")
    end
  end

  def dissolve
		# Erase the navigation stack and restart it at the current controller action.
    session[:tree] = request.original_url
  end

  def clear(path)
    session[:tree] = url_for(root_path) if session[:tree].blank?
    tree = session[:tree].split(",")

    tree.delete_if { |x| x = path }
    session[:tree] = tree.join(",")
  end

	def stepback(steps = nil)
		# Redirect to a specific point in the navigation stack from the controller
		tree = session[:tree].split(",")
		unless steps == nil
			target = tree.reverse[steps - 1]
		else
			target = tree.last
		end
		redirect_to target
	end
end
