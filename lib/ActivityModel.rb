require_relative 'Activity.rb'
# require 'csv'
# require_relative 'activities.csv'
class ActivityModel
    # reads activities from file
    # converts into array of activity objects
    def self.get_activities
        activities = File.open("activities.txt", "r").read.split("\n")
        activities = activities.map do |activity|
            activity.split(", ")
        end
        activities_arr = []
        activities.each do |activity|
            activities_arr << Activity.new(activity[0], activity[1], activity[2], activity[3])
        end
        return activities_arr
    end
    # add the new activity 
    def self.add_activity(type, distance, duration, date)
        activity = Activity.new(type, distance, duration, date)
        File.open("activities.txt", "a") do |file|
            file << "\n#{activity.type}, #{activity.distance}, #{activity.duration}, #{activity.date}"     
          end 
    end
end
