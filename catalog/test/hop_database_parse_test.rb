require 'bundler/setup'
require 'test/unit'
require 'shoulda'
require 'nokogiri'
require 'open-uri'

class HopDatabaseParseTest < Test::Unit::TestCase
  context 'parsing HTML should find table and get each row easily' do
    
    setup do
      @doc = Nokogiri::HTML(open('http://www.tasteyourbeer.com/researchcommercialbeers.php'))
    end
    
    should 'handle iterating over a table full of rows' do
      @doc.xpath('//table/tr').each do | table_row |    
        table_cells = table_row.children
        name = table_cells[0].text.strip
        alpha = table_cells[5].text.strip
        descrpt = table_cells[6].text.strip       
        # puts "hop name: #{name}, alpha: #{alpha}, descrpt: #{descrpt}"
        assert_not_nil name
        assert_not_nil alpha
        assert_not_nil descrpt
      end
      
    end
    
   
  end
  
  context 'parsing HTML should find table and get each row easily from substitutes website' do
    
    setup do
      @doc = Nokogiri::HTML(open('http://www.brewps.com/hop-chart-hop-substitutes.html'))
    end
    
    should 'handle iterating over a table full of rows' do
      @doc.xpath('//table/tbody/tr').each do | table_row | 
        name = table_row.children[0].text.strip
        sub = table_row.children[6].text.strip
        if sub.eql? '-'
          sub = ''
        end
        descrpt = table_row.children[8].text.strip
        alpha = table_row.children[2].text.strip.gsub('%', '')
        # puts "name is #{name} and sytle is #{table_row.children[4].text.strip}"
        assert_not_nil name
        assert_not_nil alpha
        assert_not_nil descrpt
        assert_not_nil sub
      end
    end
  end
  
  context 'parsing HTML should find table and get each row easily from type website - note this site is ilformed!' do
    
    setup do
      @doc = Nokogiri::HTML(open('http://beersmith.com/hop-list/'))
    end
    
    should 'handle iterating over a table full of rows' do
      @doc.xpath('//table/tr').each do | table_row | 
        name = table_row.children[0].text.strip.squeeze(' ')        
        type = table_row.children[6].text.strip
        puts "row name #{name} type: #{type}"
      end
    end
  end
end