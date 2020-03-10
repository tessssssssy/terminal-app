require_relative 'ActivityModel.rb'
require_relative 'Display.rb'
# require 'csv'

class ActivityController
    def self.menu
        puts "Choose an option:"
        puts "1 to log an activity"
        puts "2 to view completed activities"
        puts "3 to plan a new activity"
        puts "4 to show calendar"
        answer = gets.chomp.to_i
        if answer == 1
            self.add_activity(Date.today)
        elsif answer == 2
            Display.show_activities
        elsif answer == 3      
            exit
        end
    end

    def self.add_activity(date)
        puts "Activity type: "
        type = gets.chomp
        puts "Distance(kms): "
        distance = gets.chomp.to_f
        puts "Duration(mins): "
        duration = gets.chomp.to_i
        ActivityModel.add_activity(type, distance, duration, date)
    end
end


