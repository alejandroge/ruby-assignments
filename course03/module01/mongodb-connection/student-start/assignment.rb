require 'pp'
require 'mongo'

class Solution
  @@db = nil

  #Implement a class method in the `Solution` class called `mongo_client` that will
  def self.mongo_client
    @@db = Mongo::Client.new('mongodb://localhost:27017')
    @@db = @@db.use('test')
  end

  def self.collection
    @@db[:zips]
  end

  def sample
    @@db[:zips].find.first
  end
end

Mongo::Logger.logger.level = ::Logger::INFO
#byebug
db=Solution.mongo_client
p db
zips=Solution.collection
p zips
s=Solution.new
pp s.sample
