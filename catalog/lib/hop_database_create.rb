require 'nokogiri'
require 'open-uri'
require 'sqlite3'

db = SQLite3::Database.new 'hops.db'

rows = db.execute <<-SQL
  CREATE TABLE hops (_id integer  PRIMARY KEY AUTOINCREMENT DEFAULT NULL, 
  name TEXT, description TEXT, substitutions TEXT DEFAULT '', alpha_acid TEXT DEFAULT '', 
  beer_styles TEXT DEFAULT '', type TEXT DEFAULT '');
SQL

doc = Nokogiri::HTML(open('http://www.tasteyourbeer.com/researchcommercialbeers.php'))
doc.xpath('//table/tr').each do | table_row |    
  table_cells = table_row.children
  name = table_cells[0].text.strip
  alpha = table_cells[5].text.strip.gsub('-', 'to')
  descrpt = table_cells[6].text.strip       
  db.execute('INSERT INTO hops (name, description, alpha_acid) VALUES (?, ?, ?)', [name, descrpt, alpha])
end


doc = Nokogiri::HTML(open('http://www.brewps.com/hop-chart-hop-substitutes.html'))
doc.xpath('//table/tbody/tr').each do | table_row | 
  name = table_row.children[0].text.strip
  sub = table_row.children[6].text.strip
  sub = '' if sub.eql? '-'
  descrpt = table_row.children[8].text.strip
  alpha = table_row.children[2].text.strip.gsub('%', '')
  styles = table_row.children[4].text.strip.gsub('-', '')
  if(!name.eql? 'Hop Name') || (!name.eql? 'Ahtanum')
    stm = db.prepare 'SELECT * FROM hops WHERE name=?'
    stm.bind_param 1, name
    rs = stm.execute
    found = rs.next
    if found
      db.execute "UPDATE hops SET substitutions=\"#{sub}\", beer_styles=\"#{styles}\" WHERE _id=#{found[0]}"
    else
      db.execute('INSERT INTO hops (name, description, alpha_acid, substitutions, beer_styles) VALUES (?, ?, ?, ?, ?)',
        [name, descrpt, alpha, sub, styles])
    end
  end
end

doc = Nokogiri::HTML(open('http://beersmith.com/hop-list/'))
doc.xpath('//table/tr').each do | table_row | 
  name = table_row.children[0].text.strip.squeeze(' ')        
  type = table_row.children[6].text.strip
  unless name.eql? 'Name'
    iname = name.split(' ')[0]
    stm = db.prepare 'SELECT * FROM hops WHERE name LIKE ?'
    stm.bind_param 1, "%#{iname}%"
    rs = stm.execute
    found = rs.next
    if found
      db.execute "UPDATE hops SET type=\"#{type}\" WHERE _id=#{found[0]}"
    end
  end
end

