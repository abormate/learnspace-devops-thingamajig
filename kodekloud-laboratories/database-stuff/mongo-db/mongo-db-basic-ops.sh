# connect to mongo CLI shell 
mongo

# default: access control is not enabled. so anyone can read or write from the datebase -- you must configure access control manually once in production

# display list of databases
show dbs

# create and use an existing db
use <database name> 

# example "use school"

# to know what database you're on
db

# to create a new collection of documents
db.createCollection("name of collection -- example: persons")

# show collections 
show collections

# insert entry (document) to collection and create a document (json)
db.persons.insert({
  "name": "John Doe",
  "age": 40,
  "location": "London"
  })
  
# to find data from db
db.persons.find()

# guide: 
db.<name of collection>.find()

# to find something specific from the documents inside a collection
db.persons.find({"name": "John Doe"})


