# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert new rows in companies table
# INSERT INTO (SQL)
new_company = Company.new  
puts new_company.inspect
new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https://apple.com"
new_company.save
p new_company

new_company = Company.new
new_company["name"] = "Amazon"
new_company["city"] = "Seattle"
new_company["state"] = "WA"
new_company["url"] = "https://amazon.com"
p new_company
new_company.save
p new_company

new_company = Company.new
new_company["name"] = "Airbnb"
new_company["city"] = "San Francisco"
new_company["state"] = "CA"
new_company["url"] = "https://airbnb.com"
new_company.save

# 3. find total number of companies
no_of_companies = Company.all.count
puts "Companies: #{no_of_companies}"

#California companies: query companies table to find all row with California company
cali_companies = Company.where({"state"=>"CA"})
p cali_companies

#count number of california companies
puts "There are #{cali_companies.count} Cali companies"

# 4. query companies table to find single row for Apple
apple = Company.where({"name" => "Apple"})[0]
p apple

# 5. read a row's column value
p apple["name"]
p apple["city"]

# 6. update a row's column value
apple["url"] = "https://www.apple.com"
apple.save
p apple

# 7. delete a row
airbnb = Company.find_by({"name"=> "Airbnb"})
p airbnb
airbnb.destroy
no_of_companies = Company.all.count
puts "Companies: #{no_of_companies}"