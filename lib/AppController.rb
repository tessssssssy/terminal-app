require_relative 'Model.rb'
require_relative 'Display.rb'
# require 'csv'


class AppController
    def self.check_user
        puts "Enter your name: "
        user_name = gets.chomp.downcase    
        if File.exist?("users/#{user_name}.csv")
            # user = Model.get_user(user_name) #need to write this method
            self.menu(user_name)
        else 
            Model.add_user(user_name)
        end
    end

    def self.menu(user) #user name
        while true
        puts "Choose an option:"
        puts "1 to log an activity"
        puts "2 to view completed activities"
        puts "3 to view totals"
        puts "4 to show calendar"
        answer = gets.chomp.to_i
        if answer == 1
            self.add_activity(user)
        elsif answer == 2
            Display.show_activities(user)
        elsif answer == 3      
            self.view_totals(user)         
        elsif answer == 4
            exit
        end
    end
    end

    def self.add_activity(user)
        puts "Activity type: "
        type = gets.chomp
        puts "Distance(kms): "
        distance = gets.chomp.to_f
        puts "Duration(mins): "
        duration = gets.chomp.to_i
        Model.add_activity(user, type, distance, duration)
    end

    def self.view_totals(user)
        puts "Enter a month: "
        month = gets.chomp
        puts "Enter an activity type: "
        type = gets.chomp
        totals = Model.calculate_totals(user, type, month)
        Display.display_totals(totals[0], totals[1])
    end
end







