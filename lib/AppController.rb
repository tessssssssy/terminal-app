require_relative 'Model.rb'
require_relative 'Display.rb'
require 'date'
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
        puts "Choose an option:"
        puts "1 to log an activity"
        puts "2 to view activities"
        puts "3 to get stats"
        puts "4 to quit"
        answer = gets.chomp.to_i
        if answer == 1
            self.add_activity(user)
        elsif answer == 2
            Display.show_activities(user)
        elsif answer == 3      
            self.get_stats(user)         
        elsif answer == 4
            #show calendar
            exit
        end
    end
    end


    def self.add_activity(user)
        puts "Activity type: "
        type = gets.chomp.downcase
        puts "Distance(kms): "
        distance = gets.chomp.to_f
        puts "Duration(mins): "
        duration = gets.chomp.to_i
        puts "Date: (today or yyyy-mm-dd)"     
        date = gets.chomp      
        if date.downcase == "today"
            date = Date.today
        end
        Model.add_activity(user, type, distance, duration, date)
    end

    def self.get_stats(user)
    begin
        puts "Enter a month (or all): "
        months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        month = gets.chomp
        raise "Invalid date input" if month != "all" && months.downcase.include?(date.downcase) == false
        rescue RuntimeError
        puts "Please enter a month"
        retry
        end
        puts "Enter an activity type: "
        type = gets.chomp
        totals = Model.calculate_totals(user, type, month)
        records = Model.find_longest(user, type, month)
        Display.display_records(records[0], records[1])
        Display.display_totals(totals[0], totals[1])
    end
end








