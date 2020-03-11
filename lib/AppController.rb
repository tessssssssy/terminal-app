require_relative 'Model.rb'
require_relative 'Display.rb'
require_relative 'helpers.rb'

require 'date'
require "tty-prompt"
# require 'csv'


class AppController
    def self.check_user(user_name)
        # puts "Enter your name: "
        # user_name = gets.chomp.downcase    
        if File.exist?("users/#{user_name}.csv")
            self.menu(user_name)
        else 
            Model.add_user(user_name)
            self.menu(user_name)
        end
    end

    def self.menu(user) #user name
        while true
        prompt = TTY::Prompt.new
        answer = prompt.select("Choose an option: ", %w(add-activity show-activities get-stats quit))
        if answer == 'add-activity'
            self.add_activity(user)
        elsif answer == 'show-activities'
            Display.show_activities(user)
        elsif answer == 'get-stats'      
            self.get_stats(user)         
        elsif answer == 'quit'
            #show calendar
            exit
        end
    end
    end

    def self.add_activity(user)
        prompt = TTY::Prompt.new
        type = prompt.select("Select Activity: ", %w(run bike swim walk/hike))
    begin
        puts "Distance(kms): "
        distance = gets.chomp.to_f
        raise "Invalid Input" if distance == 0.0
    rescue RuntimeError
        puts "Please enter a number"
        retry
    end
    begin
        puts "Duration(mins): "
        duration = gets.chomp.to_i
        raise "Invalid Input" if duration == 0
    rescue RuntimeError
        puts "Please enter a number"
        retry
    end
    # need to handle wrong user input
    begin
        puts "Date: (today or yyyy-mm-dd)"     
        date = gets.chomp
        Date.parse(date)
    rescue Date::Error
        puts "Invalid date"
        retry
    end
        if date.downcase == "today"
            date = Date.today.to_s
        end
        Model.add_activity(user, type, distance, duration, date)
    end

    def self.get_stats(user)
        prompt = TTY::Prompt.new
        month = prompt.select("Choose an month: ", %w(All January February March April May June July August September October November December))
        prompt = TTY::Prompt.new
        type = prompt.select("Select Activity: ", %w(run bike swim walk/hike))
        totals = Model.calculate_totals(user, type, month)
        records = Model.find_longest(user, type, month)
        Display.display_records(records[0], records[1])
        Display.display_totals(totals[0], totals[1])
    end
end











