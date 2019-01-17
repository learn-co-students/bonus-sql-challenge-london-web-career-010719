require 'bundler'
require 'sqlite3'
Bundler.require

require_relative '../lib/queries.rb'

DB = {:conn => SQLite3::Database.new("guests.db")}
# Setup a DB connection here
