# require 'date'

# puts Date::MONTHNAMES[3]

# require 'terminal-table'

# # activities = Model.get_activities
# rows = []
# (1..5).each do |num|
#     rows << [1,2,3,4,5,6,7]
# end
#         table = Terminal::Table.new :title => "March", 
#                                     :headings => ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'], 
#                                     :rows => rows
#         puts table

# require 'csv'   

# # csv_text = File.read('activities.csv')
# # csv = CSV.parse(csv_text, :headers => false)
# # activities = []
# # csv.each do |row|
# #     row_data = row.to_hash
# #     if (row_data['country'] == 'Australia') && (row_data['subcountry'] == 'Victoria')
# #     puts row_data
# #     cities << row_data
# #     end 
# # end
# # puts cities.length


# # CSV.open("activities.csv", "wb") do |csv|
# #     csv << ["row", "of", "CSV", "data"]
# #     csv << ["another", "row"]
# #     # ...
# #   end

# # File.open("activities.txt", "a") do |file|
# #     file << ["run", "10"]
# # end 

# CSV.open('test.csv', 'wb') do |csv|
#     csv << ['test file']
# end

# Date::MONTHNAMES[month_num]

# require "tty-prompt"

# prompt = TTY::Prompt.new

# answer = prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))
# puts answer
# # =>
# duration = 320
# minutes = duration % 60
# hours = (duration - minutes) / 60

# puts "#{hours} hours #{minutes} mins"

# # Select drinks? (Use ↑/↓ arrow keys, press Space to select and Enter to finish)"
# # ‣ ⬡ vodka
# #   ⬡ beer
# #   ⬡ wine
# #   ⬡ whisky
# #   ⬡ bourbon

str = "fhdnajknfk"
puts str.to_f

require 'date'
date = Date.today.to_s
# date_num = date.split('-').join('').to_i
# p date
# p date_num

#takes in string checks if right format
# def valid_date?(date)
#     return false if date.class != String
#     return false if date.length != 10
#     date_arr = date.split("-")
#     return false if date.split("-") != 3
#     return false if date_arr[1].to_i > 12
#     date_arr.each do |str|
#         if str.to_i == 0
#             return false
#         end
# end
#  valid_date ="2020-03-10"
 #length == 10
 #.split('-') == 3

# p valid_date?(12424)

#compares two date strings
def compare_dates(d1, d2)
    num_1 = d1.split('-').join('').to_i
    num_2 = d2.split('-').join('').to_i
    if num_1 > num_2
        return num_1
    else
        return num_2
    end
end



require "tty-prompt"
require_relative 'Model.rb'

activities = Model.search_activities('tess', '2020-03-11') #an array of activities
p activities
prompt = TTY::Prompt.new
activity_strings = []
activities.each do |activity|
    activity_strings << "#{activity.type}-#{activity.distance}-#{activity.duration}-#{activity.date}"
end

p activity_strings
# choices = %w()
# activities.each do |activity|
#     choices << "activity" #"#{activity.type}-#{activity.distance}-#{activity.duration}-#{activity.date}"
# end
# selected_activity = prompt.select("Select Activity: ", choices)
prompt.select("Choose your destiny?") do |menu|
    menu.choice activity_strings[0] , 1
    menu.choice 'Kano', 2
    menu.choice 'Jax', -> { 'Nice choice captain!' }
  end
# =>
#
# Select drinks? (Use ↑/↓ arrow keys, press Space to select and Enter to finish)"
# ‣ ⬡ vodka
#   ⬡ beer
#   ⬡ wine
#   ⬡ whisky
#   ⬡ bourbon