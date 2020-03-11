require_relative "terminal/app/version"
require_relative 'AppController.rb'


module Terminal
  module App
    class Error < StandardError; end
    # Your code goes here...
  end
end

# Entry point to the app
AppController.check_user

