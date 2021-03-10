class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize(id=nil, name=nil, type=nil, db=nil)
      @id = id
      @name = name
      @type = type
      @db = db
    end
  
    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
      id = db.execute("SELECT last_insert_rowid() FROM pokemon")
      self.new(id,name,type,db)
    end
  
    def self.find(id, db)
      pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
      id, name, type = pokemon
      self.new(id, name, type, db)
    end
  end
