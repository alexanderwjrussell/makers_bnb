class Request

  include DataMapper::Resource

  property :id, Serial
  property :status, String
  property :date, Date
end
