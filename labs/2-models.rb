# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.
new_salesperson = Salesperson.new 
new_salesperson["first_name"] = "Nikasha"
new_salesperson["last_name"] = "Patel"
new_salesperson["email"] = "nikasha.patel@kellogg.northwestern.edu"
new_salesperson.save
p new_salesperson

new_salesperson = Salesperson.new
new_salesperson["first_name"] = "Priti"
new_salesperson["last_name"] = "Kantesaria"
new_salesperson["email"] = "priti.kantesaria@kellogg.northwestern.edu"
new_salesperson.save
p new_salesperson

# 3. write code to display how many salespeople rows are in the database

# ---------------------------------
# Salespeople: 2
no_of_salespeople = Salesperson.all.count
puts "Salespeople: #{no_of_salespeople}"


# 4. modify/update column data for a row in the salespeople table.
priti = Salesperson.find_by({"first_name"=>"Priti"})
priti["first_name"] = "Priti Sushvet"
priti.save
p priti

# CHALLENGE:
# 5. write code to display each salesperson's full name

# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng

persons = Salesperson.all
for person in persons
    first_name = person["first_name"]
    last_name = person["last_name"]
    puts "#{first_name} #{last_name}"
end

#OR

index = 0
loop do 
    if index == persons.count
        break
    end

    person = persons[index]
    first_name = person["first_name"]
    last_name = person["last_name"]
    puts "#{first_name} #{last_name}"

    index = index +1
end
