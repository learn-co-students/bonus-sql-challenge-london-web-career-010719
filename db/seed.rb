# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require 'sqlite3'
require 'csv'
require 'pry'
#require_relative '../lib/queries.rb'

sql = <<-SQL
  CREATE TABLE guests (
    id INTEGER PRIMARY KEY,
    year INTEGER,
    occupation TEXT,
    show TEXT,
    showgroup TEXT,
    name TEXT
    );
  SQL
DB = {:conn => SQLite3::Database.new("guests.db")}
DB[:conn].execute(sql)
csv = File.read('daily_show_guests.csv')
id = 0
CSV.parse(csv, headers: true).each do |row|
  id += 1
  sql = <<-SQL
    INSERT INTO guests (id, year, occupation, show, showgroup, name)
    VALUES ( ?, ?, ?, ?, ?, ? )
    SQL
  DB[:conn].execute(sql, id, row.fields)
end

binding.pry
puts 'o'
