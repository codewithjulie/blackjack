require 'pg'

db = PG.connect(dbname: 'test', user: 'test', password: 'password')

person = db.exec("SELECT * FROM person")

person.each do |pers|
  puts pers
end