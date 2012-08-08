require 'rubygems'
require 'sinatra'
require 'json'
require 'sqlite3'
# insert into quotes Values(null, "", "");

db = SQLite3::Database.new( "quotes.db" )
db.results_as_hash = true

get '/' do
  redirect 'index.html'
end

get '/quote' do
  
 random_quote = Hash.new  
  
 db.execute("SELECT quote, attribution FROM quotes ORDER BY RANDOM() LIMIT 1") do |h|
   random_quote['quote'] = h['quote']
   random_quote['attribution'] = h['attribution']
 end
 
 "#{JSON.generate(random_quote)}"
end

post '/add' do
  
  if(params[:secret].match(/SECRET/)) 
    stmt = "INSERT INTO quotes VALUES(null, ?,?)"
    
    db.execute(stmt, params[:quote], params[:who])
    
  end
  
  redirect 'add.html'
  
end

