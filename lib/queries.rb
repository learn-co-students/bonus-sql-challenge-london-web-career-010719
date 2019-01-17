# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances
  sql = <<-SQL
    SELECT name, COUNT(id)
    FROM guests
    GROUP BY name
    ORDER BY COUNT(id) DESC
    LIMIT 1
  SQL
  DB[:conn].execute(sql)
end

def guest_with_most_appearances_by_year
  sql = <<-SQL
    SELECT year, name, COUNT(id)
    FROM guests
    WHERE year = ?
    GROUP BY name
    ORDER BY COUNT(id) DESC
    LIMIT 1
  SQL
    year = 1999 #we can automize this
    popular_guests = []
    17. times do #we can automize the times here too
      popular_guests << DB[:conn].execute(sql, year)
      year += 1
    end
    popular_guests
end

def profession_most_appearances
  sql = <<-SQL
    SELECT occupation, COUNT(id)
    FROM guests
    GROUP BY occupation
    ORDER BY COUNT(id) DESC
    LIMIT 1
  SQL
  DB[:conn].execute(sql)
end

def patrick_appearances
  sql = <<-SQL
    SELECT show
    FROM guests
    WHERE name = 'Patrick Stewart'
  SQL
  DB[:conn].execute(sql)
end

def most_guest_year
  sql = <<-SQL
    SELECT year, COUNT(DISTINCT name)
    FROM guests
    GROUP BY year
    ORDER BY COUNT(id) DESC
    LIMIT 1
  SQL
  DB[:conn].execute(sql)
end

def most_popular_group
  sql = <<-SQL
    SELECT year, showgroup, COUNT(id)
    FROM guests
    WHERE year = ?
    GROUP BY showgroup
    ORDER BY COUNT(id) DESC
    LIMIT 1
  SQL
    year = 1999 #we can automize this
    popular_groups = []
    17. times do #we can automize the times here too
      popular_groups << DB[:conn].execute(sql, year)
      year += 1
    end
    popular_groups
end

def first_name_bill
  sql = <<-SQL
    SELECT name
    FROM guests
  SQL
  all_guests_names = DB[:conn].execute(sql)
  all_guests_names.select {|guest| guest[0].split(" ")[0] == 'Bill'}
end
