class Racer
  attr_accessor :id, :number, :first_name, :last_name, :gender, :group, :secs

  def initialize(params={})
    @id = params[:_id].nil? ? params[:id] : params[:_id].to_s
    @number = params[:number].to_i
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @gender = params[:gender]
    @group = params[:group]
    @secs = params[:secs].to_i
  end

  def self.find(id)
    result = self.collection.find({ _id: id }).first
    result.nil? ? nil : Racer.new(result)
  end

  def self.mongo_client
    Mongoid::Clients.default
  end

  def self.collection
    mongo_client[:racers]
  end

  def self.all(protype={}, sort={ number: 1 }, skip=0, limit=nil)
    self.collection
      .find(protype)
      .sort(sort)
      .skip(skip)
      .limit(limit.to_i)
  end
end
