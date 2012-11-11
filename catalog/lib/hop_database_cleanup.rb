require 'nokogiri'
require 'open-uri'
require 'sqlite3'

db = SQLite3::Database.new 'hops.db'


# stm = db.prepare 'SELECT * FROM hops WHERE type=?'
# stm.bind_param 1, ''
# rs = stm.execute
# found = rs.next
# if found
#  puts "where type is blank: #{found[1]}"
# else
#  
# end

rows = db.execute( "SELECT * FROM hops WHERE beer_styles=''" )

rows.each do | row |
  puts "name is #{row[1]}"
  # puts "choices are Aroma or Bittering or Both"
  type = gets
  puts "style is #{type} from gets"
  itype = type.gsub('\n', '').strip
  db.execute "UPDATE hops SET beer_styles=\"#{itype}\" WHERE _id=#{row[0]}"
end