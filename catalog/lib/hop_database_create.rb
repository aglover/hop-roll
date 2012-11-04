require 'nokogiri'
require 'open-uri'
require "sqlite3"

# Open a database
db = SQLite3::Database.new "hops.db"

# Create a database
rows = db.execute <<-SQL
  CREATE TABLE hops (_id integer  PRIMARY KEY AUTOINCREMENT DEFAULT NULL, name TEXT, description TEXT, substitutions TEXT, alpha_acid TEXT);
SQL

doc = Nokogiri::HTML(open('http://www.tasteyourbeer.com/researchcommercialbeers.php'))
doc.xpath('//table/tr').each do | table_row |    
  table_cells = table_row.children
  name = table_cells[0].text.strip
  alpha = table_cells[5].text.strip.gsub('-', 'to')
  descrpt = table_cells[6].text.strip       
  
  db.execute("INSERT INTO hops (name, description, alpha_acid) VALUES (?, ?, ?)", [name, descrpt, alpha])
  
end



doc = Nokogiri::HTML(open('http://www.brewps.com/hop-chart-hop-substitutes.html'))
doc.xpath('//table/tbody/tr').each do | table_row | 
  name = table_row.children[0].text.strip
  sub = table_row.children[6].text.strip
  sub = '' if sub.eql? '-'
  descrpt = table_row.children[8].text.strip
  alpha = table_row.children[2].text.strip.gsub('%', '')
  
  unless name.eql? 'Hop Name'
    stm = db.prepare "SELECT * FROM hops WHERE name=?"
    stm.bind_param 1, name
    # puts "searching for name: #{name}"
    rs = stm.execute
    found = rs.next
    if found
      # puts "found: #{found}"
      db.execute "UPDATE hops SET substitutions=\"#{sub}\" WHERE id=#{found[0]}"
    else
      db.execute("INSERT INTO hops (name, description, alpha_acid, substitutions) VALUES (?, ?, ?, ?)", [name, descrpt, alpha, sub])
    end
  end
end