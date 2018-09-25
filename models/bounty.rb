require ("pg")

class Bounty

attr_accessor :name, :species, :bounty_value, :danger_level

def initialize(stats)
  @id = stats["id"].to_i() #this will get passed back to the object when the new entry is saved.
  @name = stats["name"]
  @species = stats["species"]
  @bounty_value = stats["bounty_value"].to_i()
  @danger_level = stats["danger_level"]
end


#Implement save,

def save()
  db = PG.connect({
    dbname: "bounty_hunters",
    host: "localhost"
    })

    sql = "
    INSERT INTO bounties(
      name,
      species,
      bounty_value,
      danger_level
    )
    VALUES ($1, $2, $3, $4)
    RETURNING id;
    "

    db.prepare("save", sql)
    result = db.exec_prepared("save", [@name, @species, @bounty_value, @danger_level])
    db.close()

    # this brings back the ID assigned by the database and converts it to a string and assigns it to the object so that it can be used
    #pulls the hash that comes back so we can access the id
    result_hash = result[0]
    # plucks out JUST the id - which comes back from the db as a string
    string_id = result_hash['id']
    # converts the string to an integer and stores it in the variable 'id'
    @id = string_id.to_i()
    # saves the integer into the instance variable @id - can skip this step by just saving the string_id.to_i into that variable as above.
    #@id = id

  end

#self.delete_all,

  def self.delete_all()
    db = PG.connect({
      dbname: "bounty_hunters",
      host: "localhost"
    })

    sql = "DELETE FROM bounties;"

    db.exec(sql)
    db.close()
  end

#self.all and

  def self.all()
    db = PG.connect({
      dbname: "bounty_hunters",
      host: "localhost"
    })

    sql = "SELECT * FROM bounties;"

    db.prepare("all", sql)
    bounty_hashes = db.exec_prepared("all")
    db.close()

    bounty_objects = bounty_hashes.map { |bounty_hash| Bounty.new(bounty_hash)  }


  return bounty_objects

  end

#update methods on your class

  def update()
    db = PG.connect({
      dbname: "bounty_hunters",
      host: "localhost"
    })

    sql = "
      UPDATE bounties
      SET(
        name,
        species,
        bounty_value,
        danger_level
      ) = ( $1, $2, $3, $4 )
      WHERE id = $5;
    "
    values = [
      @name,
      @species,
      @bounty_value,
      @danger_level,
      @id
    ]

    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()

  end

# self.find

  def self.find(id)
    db = PG.connect({
      dbname: "bounty_hunters",
      host: "localhost"
    })

    sql = "
    SELECT * FROM bounties
    WHERE id = $1;
    "

    value = [id]

    db.prepare("find", sql)
    found = db.exec_prepared("find", value)
    db.close()

    found_object = found.map { |found_hash| Bounty.new(found_hash)  }

    return found_object

  end

# item delete

# def self.delete(id)
#   db = PG.connect({
#     dbname: "bounty_hunters",
#     host: "localhost"
#   })
#
#   sql = "
#   DELETE FROM bounties
#   WHERE id = $1
#  "
#  value = [id]
#
#  db.prepare("find", sql)
#  found = db.exec_prepared("find", value)
#  db.close()
# end


# item delete v2

def delete()
  db = PG.connect({
    dbname: "bounty_hunters",
    host: "localhost"
  })

  sql = "
  DELETE FROM bounties
  WHERE id = $1
 "
 value = [@id]

 db.prepare("find", sql)
 found = db.exec_prepared("find", value)
 db.close()
end









  # class end
end
