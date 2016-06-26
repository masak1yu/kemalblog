class BaseModel
  #getter? conn : PG::Connection
  def initialize
    ENV["DATABASE_URL"] ||= "postgres://preface@localhost:5432/kemalblog_dev"
    @conn = PG::Connection.new(ENV["DATABASE_URL"])
    pg = ConnectionPool(PG::Connection).new(capacity: 25, timeout: 0.1) do
      PG.connect(ENV["DATABASE_URL"])
    end
    @conn = pg.connection

    #pg_connect ENV["DATABASE_URL"]
  end
end
