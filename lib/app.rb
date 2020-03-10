require_relative "terminal/app/version"
require_relative 'ActivityController.rb'

module Terminal
  module App
    class Error < StandardError; end
    # Your code goes here...
  end
end

# Entry point to the app

ActivityController.menu

