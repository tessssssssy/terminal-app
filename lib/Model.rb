require_relative 'Activity.rb'
require_relative 'helpers.rb'
require 'date'
require 'csv'

# require 'csv'
# require_relative 'activities.csv'
class Model
    @@activities = []
    def self.add_user(user)
        csv = CSV.open("users/#{user}.csv", 'wb') do |csv|
        end
    end

    def self.get_activities(user)
        activities = File.open("users/#{user}.csv", "r").read.split("\n")
        activities = activities.map do |activity|
            activity.split(",")
        end
        @@activities = []
        activities.each do |activity|
            new_activity = Activity.new(activity[0], activity[1], activity[2], activity[3])
            new_activity.completed = activity[4] # true or false
            @@activities << new_activity
            # if is_in_past?(new_activity.date)
            #     new_activity.complete_activity
            # end
        end
        # sort activities by date
        # @@activities = @@activities.sort_by {|obj| obj.date.to_s.split('-').join('').to_i } #weird errors happening here
        return @@activities #.reverse
    end
    
    def self.update_activities(user, activities)
        CSV.open("users/#{user}.csv", "wb") do |file|
            activities.each do |activity|
              file << [activity.type, activity.distance, activity.duration, activity.date, activity.completed] 
            end   
          end
    end
    # add the new activity 
    #append it to the users file
    def self.add_activity(user, type, distance, duration, date)
        activity = Activity.new(type, distance, duration, date)
        if is_in_past?(activity.date)
            activity.completed = true # checks activity completed if in the past
        end
        @@activities << activity # pushes into the activities array
        #appends to file
        CSV.open("users/#{user}.csv", "a") do |file|
            file << [activity.type, activity.distance, activity.duration, activity.date, activity.completed]    
          end
        return @@activities
    end

    def self.search_activities(user, date)
        matched = []
        @@activities.each do |activity|
            if activity.date == date && activity.completed == 'false'
                matched << activity
            end
        end
        return matched  # return array of activities that match date
    end

    def self.delete_activity(user, activity)
        activities = self.get_activities(user)
        activities = activities.select do |a|
            # if a.type == activity.type && a.distance == activity.distance && a.duration == activity.distance
            #     activities.delete_at(index)
            # end
            a.type != activity.type || a.distance != activity.distance || a.duration != activity.duration
        end
        self.update_activities(user, activities)
        p activities
        p activity
    end

    def self.find_longest(user, type, month)
        longest_distance = 0
        longest_duration = 0
        activities = self.get_activities(user)
        activities.each do |activity|
            month_num = activity.date.to_s.split('-')[1].to_i
            if month == 'All' || month == Date::MONTHNAMES[month_num]
                if activity.distance.to_f > longest_distance
                    longest_distance = activity.distance.to_f
                end
                if activity.duration.to_i > longest_duration
                    longest_duration = activity.duration.to_i
                end 
            end
        end
        minutes = longest_duration % 60
        hours = (longest_duration - minutes) / 60
        return [longest_distance, "#{hours} hours #{minutes} mins"]
    end

    def self.calculate_totals(user, type, month)
        distance = 0
        duration = 0
        activities = self.get_activities(user)        
        activities.each do |activity|
            month_num = activity.date.to_s.split('-')[1].to_i
            if activity.type == type && ( month == 'All' || month == Date::MONTHNAMES[month_num] )
                distance += activity.distance.to_f
                duration += activity.duration.to_i
            end
        end
        minutes = duration % 60
        hours = (duration - minutes) / 60
        return [distance, "#{hours} hours #{minutes} mins"]
    end
end












 