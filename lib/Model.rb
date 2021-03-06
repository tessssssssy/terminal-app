require_relative 'Activity.rb'
require_relative 'helpers.rb'
require 'date'
require 'csv'

# The model class processes data from user input and csv files and interacts with the controller

class Model
    @@activities = []

    # create a file for a new user
    def self.add_user(user)
        csv = CSV.open("users/#{user}.csv", 'wb') do |csv|
        end
    end

    # parses activity data from users file 
    # uses to create new activity objects and add to activities array
    def self.get_activities(user)
        activities = File.open("users/#{user}.csv", "r").read.split("\n")
        activities = activities.map do |activity|
            activity.split(",")
        end

        @@activities = []
        activities.each do |activity|
            new_activity = Activity.new(activity[0], activity[1], activity[2], activity[3])
            new_activity.completed = activity[4]
            @@activities << new_activity
        end

        # sort activities by date
        @@activities = @@activities.sort_by {|obj| obj.date.to_s.split('-').join('').to_i }
        return @@activities.reverse # sort from newest to oldest
    end
    
    # iterates over activities array
    # overwrites file with updated activities
    def self.update_activities(user)
        CSV.open("users/#{user}.csv", "wb") do |file|
            @@activities.each do |activity|
              file << [activity.type, activity.distance, activity.duration, activity.date, activity.completed] 
            end   
          end
    end

    # adds a new activity 
    # append it to the users file
    def self.add_activity(user, type, distance, duration, date)
        activity = Activity.new(type, distance, duration, date)
        if is_in_past?(activity.date)
            activity.completed = true #checks activity completed if in the past
        end
        @@activities << activity
        #appends to file
        CSV.open("users/#{user}.csv", "a") do |file|
            file << [activity.type, activity.distance, activity.duration, activity.date, activity.completed]    
          end
        return @@activities
    end

    # search for activities by date
    #returns array of activities that match date input
    def self.search_activities(user, date)
        matched = []
        @@activities.each do |activity|
            if activity.date == date && activity.completed == 'false'
                matched << activity
            end
        end
        return matched  
    end

    # deletes an activity based on user selection
    # updates the csv file to remove the deleted activity
    def self.delete_activity(user, activity) 
        activities = self.get_activities(user)
        @@activities = activities.select do |a|
            a.type != activity.type || a.distance != activity.distance || a.duration != activity.duration
        end
        self.update_activities(user)      
    end

    # finds the users longest activities by time and distance
    # returns an array with longest distance and longest time to send to display
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

    # calculates users total distance and time for a particular activity for a month (or all months)
    # returns an array to send to display class
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












 