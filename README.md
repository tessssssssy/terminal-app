
Application Source Code
---
https://github.com/tessssssssy/terminal-app

Purpose of the application
---
My application is an exercise planning and recording app. The application has multiple features. Users can schedule future workouts and log past workouts, recording workout type, distance, duration and date. They can also check off workouts as completed and view workout stats

What problem is this app trying to solve
---

This application aims to be a motivational tool to encourage people to get more exercise. It builds users accountability to an exercise plan by allowing them to plan future workouts and check them off as they are completed. 

Target Audience
---
The app is intended for anyone who is interested in starting an exercise plan and want to record their workouts. The app is focused on exercises with the ability to record time and distance, including running, cycling, swimming, walking and hiking so would be particularly suited to people who are interested in those activities. 

How the audience will use the application
---
Users will use the application to create their own exercise plan, log and check off completed workouts and to calculate and monitor their monthly activity totals. 

Application Features
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

User Interaction
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

User Interaction Diagram
---
![User Interaction Diagram](images/Terminal-app.png)

Implementation Plan
---
Develop an implementation plan which:
- outlines how each feature will be implemented and a checklist of tasks for each feature
- prioritise the implementation of different features, or checklist items within a feature
- provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

Utilise a suitable project management platform to track this implementation plan

> Your checklists for each feature should have at least 5 items.

Structure
---
The application will be written using a Model, View, Controller (MVC) type structure

-  The model will interact with and manipulate user data taken from user input and stored in 
a csv file. It will also send data to the display class to display to the user

-  The controller is responsible for taking user input and controlling the flow of the application. It
sends user input to the model where it is processed and stored on a csv file

-  The display class will take user data from the model and display it in a visually appealing way to the user

- An Activity class will be used to create a blueprint for activity objects

- A csv file will be allocated to each user to store their activities

Features
---
1. Main Menu
- create a menu method in controller class
- direct user to various sub menus/features
- use a loop to continue showing user menu options until they quit app
- install tty prompt gem to create more user friendly menu
- handle user input errors
 

2. Add Activity
- Create an activity class with type, distance, duration, date parameters
- Create a method in controller that takes user input
- Create method in model that processes user input and creates activity object
- Append new activity to csv file

3. Show Activities
- need a method to get activities from csv file and add to an array
- method in display class to display data in a presentable way
- use terminal-table gem to display the activities as a table
- sort data to show newest activities first

4. Check off completed activities
- create a method to search for activities by date
- method to handle user input 
- method to take selected activity and set completed
- change color of completed activity in display class
- auto set complete if a user logs a past activity

5. Delete Activity
- method to search for activity to delete
- handle user input
- remove activity from activities array
- method to update the csv file
- redirect to main menu if no activities to delete

6. Get Stats
- method to calculate total distance/time
- Display method to show totals
- method to find longest activities
- Display method to show longest activities
- method to handle user input - sub menu to enter activity 
type, month

Project Management
---
I will be utilizing trello for project management

Documentation
---

Installation

```bash

gem install terminal-app

```

Gemfile

```ruby

gem 'terminal-app', '~> 0.1.1'

```

Install Dependencies

```bash
bundle install
```

Running the application

```bash
ruby terminal-app <username>
```
Instructions 

1. Enter a username as a command line argument

2. If it is a new user, a file will be created to store the users activities, otherwise, the username will be matched to their corresponding csv file with their stored data.

Command Line Interface
---

Main Menu

![Main Menu](images/main-menu.png)

Show Activities

![Show Activities](images/show.png)


Check Completed sub-menu

![Check Completed](images/check-completed.png)

Delete Activity sub-menu

![Delete](images/delete.png)

Get Stats

![Get Stats](images/get-stats.png)