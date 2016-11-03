class Space
  include DataMapper::Resource


  property :id,              Serial
  property :space_name,      String
  property :description,     Text
  property :price_per_night, Float
  property :available_from,  Date
  property :available_to,    Date

end
