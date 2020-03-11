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

require "tty-prompt"

prompt = TTY::Prompt.new

answer = prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))
puts answer
# =>
duration = 320
minutes = duration % 60
hours = (duration - minutes) / 60

puts "#{hours} hours and #{minutes} minutes"

# Select drinks? (Use ↑/↓ arrow keys, press Space to select and Enter to finish)"
# ‣ ⬡ vodka
#   ⬡ beer
#   ⬡ wine
#   ⬡ whisky
#   ⬡ bourbon

