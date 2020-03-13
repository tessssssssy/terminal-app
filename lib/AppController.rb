require_relative 'Model.rb'
require_relative 'Display.rb'
require_relative 'helpers.rb'
require_relative 'Activity.rb'
require 'date'
require "tty-prompt"


class AppController
    # run at start of program to check if new user
    # either create a file for new user or get activities for returning user
    def self.check_user(user_name)  
        if File.exist?("users/#{user_name}.csv")
            Model.get_activities(user_name) 
            self.menu(user_name)
        else 
            Model.add_user(user_name)
            self.menu(user_name)
        end
    end

    # main menu - run straight after user check
    def self.menu(user)
      while true
        prompt = TTY::Prompt.new
        answer = prompt.select("Choose an option: ", %w(add-activity show-activities check-completed-activity delete-activity get-stats quit))
        if answer == 'add-activity'
            self.add_activity(user)
        elsif answer == 'show-activities'
            Display.show_activities(user)
        elsif answer == 'check-completed-activity'
            self.check_completed(user)
        elsif answer == 'get-stats'      
            self.get_stats(user)    
        elsif answer == 'delete-activity' 
            self.delete_activity(user)    
        elsif answer == 'quit'
            exit
        else 
            puts "Invalid Input"
        end
      end
    end

    # looks up activities based on user input date
    # returns an array of activities that match date
    def self.get_activities_by_date(user)
        begin
            puts "Activity date: (today or yyyy-mm-dd): "
            date = gets.chomp
            if date == "today"
                date = Date.today.to_s
            else
                # run to test for invalid dates
                Date.parse(date) 
            end
            activities = Model.search_activities(user, date)
        raise "No activities on that date" if activities.length == 0 || is_in_future?(date)
        rescue Date::Error, RuntimeError 
            puts "Invalid date"
            self.menu(user)
        end 
        return activities   
    end

    # takes array of activities and generates a drop down menu
    # used for selecting activities to check completed or to delete
    # returns users chosen activity
    def self.select_activity(user, activities)
        prompt = TTY::Prompt.new
            options = %w(go-back)
            activities.each do |activity|
                options << "#{activity.type}-#{activity.distance}-#{activity.duration}-#{activity.date}"
            end
            selected_activity = prompt.select("Select Activity: ", options)
            if selected_activity == 'go-back'
                self.menu(user)
            end
            
            # iterates over array of activities, converts to string for comparison with user selection
            activities.each do |activity|
                activity_string = "#{activity.type}-#{activity.distance}-#{activity.duration}-#{activity.date}"
                if activity_string == selected_activity
                    return activity
                end
            end
    end
    
    def self.check_completed(user)
        activities = self.get_activities_by_date(user)
        activity = self.select_activity(user, activities)
        activity.completed = true 
        Model.update_activities(user)
    end

    def self.delete_activity(user)
        activities = self.get_activities_by_date(user)
        activity = self.select_activity(user, activities)
        Model.delete_activity(user, activity)
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

