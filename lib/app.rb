require_relative "terminal/app/version"
require_relative 'AppController.rb'

module Terminal
  module App
    class Error < StandardError; end
    # Your code goes here...
  end
end

if ARGV.length != 1
  puts "One argument required"
  exit
end
# pass the user name into the terminal
user_name = ARGV[0]
ARGV.clear
# Entry point to the app
AppController.check_user(user_name)

# AppController.check_user

