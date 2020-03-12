You are to design, implement and test a terminal application and throughout the process demonstrate that you are able to use a range of developer tools.

The mandatory requirements/constraints for your application are:

accept user input in the form of a file or text input
produce printed output or interact with the file system

Activity Log/Workout Calendar app

records activities
plan future workouts

type - ride, run, swim, walk, etc
distance
duration
sorted by date/time

Functions
1. record past activites

2. Plan future activities 
- also edit, delete activities
- check off completed activities

3. View activities - list/calendar/totals
- need a way to display completed vs planned activities differently

Reads activities from a file
Writes activities to the file

Gems 
- terminal-table - display activities as a calendar
- colorize (display )

Extension
- reads garmin files - converting gpx to csv


R4	Provide a link to your source control repository
---
https://github.com/tessssssssy/terminal-app

R5	Develop a statement of purpose and scope for your application.
---
My application is an exercise planning and recording app. The application has multiple features. Users can schedule future workouts and log past workouts, recording workout type, distance, duration and date. They can also check off workouts as completed and view workout stats

identify the problem it will solve and explain why you are developing it
---

This application aims to be a motivational tool to encourage people to get more exercise. It builds users accountability to an exercise plan by allowing them to plan future workouts and check them off as they are completed. 

identify the target audience
---
The app is intended for anyone who is interested in starting an exercise plan and want to record their workouts. The app is focused on exercises with the ability to record time and distance, including running, cycling, swimming, walking and hiking so would be particularly suited to people who are interested in those activities. 

explain how a member of the target audience will use it
---
Users will use the application to 


R6 Application Features
---
1. Users can log completed workouts and record details icluding:
- workout type: run, ride, swim or walk/hike
- distance
- duration
- date completed

2. Users can schedule future workouts in the same way they log past ones. Recording the planned workout type, distance, duration and the date they want to complete it.

3. View a table of all workouts and their details. These are colour coded, with different colours for completed, incomplete past workouts and future planned workouts.

4. Users can check off completed activities. This will change the colour of the activity in the view table. When a past activity is logged, it is checked completed automatically.

5. Get workout stats. Users can view the total distance and duration for each workout type, and see their longest workouts by distance and duration. Users can choose to see totals and personal records for a specific months or view all.

R7 User Interaction
---
1. Users will type their name/username as a command line argument when they run the application

2. The user will choose an option from a main menu: 
- add activity
- show activities
- check completed activity
- get stats
- quit: quits the application

3. The user will then be directed to one of the sub menus:
- add activity: asked to input activity type, distance, duration and date
- show activities: displays a table listing all the users activities
- check-completed-activities: asks the user for a date, then shows a list of activities on that date for the user to check off
- get stats: asks user to enter activity type and month, then shown a table of activity totals/personal records

4. If the user ever enters an invalid input, the application will detect it and ask them to try again



