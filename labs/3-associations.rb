# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts
priti = Salesperson.find_by({"first_name" => "Priti Sushvet"})
nikasha = Salesperson.find_by({"first_name" => "Nikasha"})
tim = Contact.find_by({"first_name" => "Tim"})
craig = Contact.find_by({"first_name" => "Craig"})

activity = Activity.new
activity["salesperson_id"] = priti["id"]
activity["contact_id"] = tim["id"]
activity["note"] = "phonecall"
activity.save

activity = Activity.new
activity["salesperson_id"] = nikasha["id"]
activity["contact_id"] = craig["id"]
activity["note"] = "meeting"
activity.save

activity = Activity.new
activity["salesperson_id"] = priti["id"]
activity["contact_id"] = craig["id"]
activity["note"] = "completed project"
activity.save

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):
# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino
puts "Activites between Nikasha and Craig:"
activities = Activity.where({
    "salesperson_id" => nikasha["id"],
    "contact_id" => craig["id"]
})
for activity in activities
    note = activity["note"]
    puts "- #{note}"
end

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

puts "Priti's Activities:"
activities = Activity.where({
    "salesperson_id" => priti["id"]
})

for activity in activities
    contact = Contact.find_by({"id" => activity["contact_id"]})
    contact_first = contact["first_name"]
    contact_last = contact["last_name"]
    note = activity["note"]
    puts "#{contact_first} #{contact_last} - #{note}"
end

# 3a. Can you include the contact's company?
# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

puts "Priti's Activities:"
activities = Activity.where({
    "salesperson_id" => priti["id"]
})

for activity in activities
    contact = Contact.find_by({"id" => activity["contact_id"]})
    contact_first = contact["first_name"]
    contact_last = contact["last_name"]
    company = Company.find_by({"id" => contact["company_id"]})
    company_name = company["name"]
    note = activity["note"]
    puts "#{contact_first} #{contact_last} (#{company_name}) - #{note}"
end

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
salespeople = Salesperson.all
for salesperson in salespeople
    activities = Activity.where({"salesperson_id" => salesperson["id"]})
    number_of_activities = activities.count
    puts "#{number_of_activities} activities"
end