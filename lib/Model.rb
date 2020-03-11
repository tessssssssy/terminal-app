require_relative 'Activity.rb'
require_relative 'User.rb'
require 'date'
require 'csv'

# require 'csv'
# require_relative 'activities.csv'
class Model
    # reads activities from file
    # converts into array of activity objects
    def self.add_user(user)
        csv = CSV.open("users/#{user}.csv", 'wb') do |csv|
        end
        # user = User.new(user, csv)
        # add user to users.csv file
    end
    # # takes in a name and returns user object
    # def self.get_user(user_name)
    #     users = File.open("users.csv", "r").split("/n")
    #     users = users.map do |user|
    #         user.split(",")
    #     end
    #     users_arr = []
    #     users.each do |user|
    #         users_arr << User.new(activity[0], activity[1], activity[2], activity[3])
    #     end
    #     return users_arr
    # end

    def self.get_activities(user)
        activities = File.open("users/#{user}.csv", "r").read.split("\n")
        activities = activities.map do |activity|
            activity.split(",")
        end
        # activities = CSV.open("activities.csv", "r")
        # activities
        activities_arr = []
        activities.each do |activity|
            activities_arr << Activity.new(activity[0], activity[1], activity[2], activity[3])
        end
        return activities_arr
    end

    # add the new activity 
    #append it to the users file
    def self.add_activity(user, type, distance, duration, date)
        activity = Activity.new(type, distance, duration, date)
        # File.open("activities.txt", "a") do |file|
        #     file << ""
        # end
        CSV.open("users/#{user}.csv", "a") do |file|
            file << [activity.type, activity.distance, activity.duration, activity.date]    
          end 
    end

    def self.find_longest(user, type, month)
        longest_distance = 0
        longest_duration = 0
        activities = self.get_activities(user)
        activities.each do |activity|
            month_num = activity.date.to_s.split('-')[1].to_i
            if month == 'all' || month == Date::MONTHNAMES[month_num]
                if activity.distance.to_f > longest_distance
                    longest_distance = activity.distance.to_f
                end
                if activity.duration.to_f == longest_duration
                    longest_duration = activity.duration.to_f
                end 
            end
        end
        return [longest_distance, longest_duration]
    end

    def self.calculate_totals(user, type, month)
        distance = 0
        duration = 0
        # loop over activity array 
        # if date matches and name matches 
        # increment time and duration
        activities = self.get_activities(user)        
        activities.each do |activity|
            month_num = activity.date.to_s.split('-')[1].to_i
            if activity.type == type && ( month == 'all' || month == Date::MONTHNAMES[month_num] )
                distance += activity.distance.to_f
                duration += activity.duration.to_f
            end
        end
        return [distance, duration]
    end
end






 