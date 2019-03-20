require "backpedal/version"

module Backpedal
  extend ActiveSupport::Concern

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :skipped_verbs

    def initialize
      @skipped_verbs = Array.new
    end
  end

  def grow_tree
    session[:tree] = url_for(root_path) if session[:tree].blank?

    tree = session[:tree].split(",")
    previous_page = request.referer
    current_page = request.original_url


    if tree.last == current_page
      # remove this page from the stack if the user was just here(clicked back link)
      tree.pop
      session[:tree] = tree.join(",")
    elsif request.referer.present? and request.referer != tree.last and ["new", "edit", "delete", "destroy"].exclude? request.referer.split("/").last.split("?")[0]
      tree << previous_page
      session[:tree] = tree.join(",")
    end
  end

  def shake_tree
    # session[:tree] = url_for(root_path)
    session[:tree] = request.original_url
  end

  def clear_branch(path)
    session[:tree] = url_for(root_path) if session[:tree].blank?
    tree = session[:tree].split(",")

    tree.delete_if { |x| x = path }
    session[:tree] = tree.join(",")
  end
end
