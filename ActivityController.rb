require_relative 'ActivityModel'

class ActivityController
    def choose_option
        puts "Choose an option:"
        puts "1 to add an activity"
        puts "2 to view activities"
        return gets.chomp.to_i
    end

    def add_activity
        puts "Activity type: "
        type = gets.chomp
        puts "Distance(kms): "
        distance = gets.chomp.to_f
        puts "Duration(mins): "
        duration = gets.chomp.to_i
        ActivityModel.add_activity(type, distance, duration)
    end
end