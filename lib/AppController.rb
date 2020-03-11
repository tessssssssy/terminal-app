require_relative 'Model.rb'
require_relative 'Display.rb'
require_relative 'helpers.rb'
require_relative 'Activity.rb'

require 'date'
require "tty-prompt"
# require 'csv'


class AppController
    def self.check_user(user_name)  
        if File.exist?("users/#{user_name}.csv")
            Model.get_activities(user_name) # loads the users activities into an array
            # Model.read_file(user_name)
            self.menu(user_name)
        else 
            Model.add_user(user_name)
            self.menu(user_name)
        end
    end

    def self.menu(user) #user name
      while true
        prompt = TTY::Prompt.new
        answer = prompt.select("Choose an option: ", %w(add-activity show-activities check-completed-activity get-stats quit))
        if answer == 'add-activity'
            self.add_activity(user)
        elsif answer == 'show-activities'
            Display.show_activities(user)
        elsif answer == 'check-completed-activity'
            self.check_completed(user) 
        elsif answer == 'get-stats'      
            self.get_stats(user)         
        elsif answer == 'quit'
            exit
        else 
            puts "Invalid Input"
        end
      end
    end

    def self.check_completed(user)
        begin
            puts "Activity date: (today or yyyy-mm-dd): "
            date = gets.chomp
            if date == "today"
                date = Date.today.to_s
            end
            Date.parse(date)
            activities = Model.search_activities(user, date) #an array of activities
        raise "No activities on that date" if activities.length == 0
        rescue Date::Error, RuntimeError
            puts "Invalid date"
            retry
        end           
            prompt = TTY::Prompt.new
            options = %w()
            activities.each do |activity|
                options << "#{activity.type}-#{activity.distance}-#{activity.duration}-#{activity.date}"
            end
            selected_activity = prompt.select("Select Activity: ", options)
            activities.each do |activity|
                activity_string = "#{activity.type}-#{activity.distance}-#{activity.duration}-#{activity.date}"
                if activity_string == selected_activity
                    activity.completed = true
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
        if date != "today"
            Date.parse(date)
        end
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











