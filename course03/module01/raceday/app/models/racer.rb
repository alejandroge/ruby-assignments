class Racer
  include ActiveModel::Model

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
    result = self.collection.find({ _id: BSON::ObjectId.from_string(id.to_s) }).first
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

  def save
    result = self.class.collection.insert_one({
      number: @number, first_name: @first_name, last_name: @last_name, gender: @gender,
      group: @group, secs: @secs
    })
    @id = result.inserted_id.to_s
  end

  def update(params)
    @number = params[:number].to_i
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @group = params[:group]
    @gender = params[:gender]
    @secs = params[:secs].to_i

    params.slice!(:number, :first_name, :last_name, :gender, :group, :secs)
    self.class.collection.find(_id: BSON::ObjectId.from_string(@id)).replace_one(params)
  end

  def destroy
    self.class.collection.find(_id: BSON::ObjectId.from_string(@id)).delete_one
  end

  def persisted?
    @id.present?
  end

  def created_at
    nil
  end

  def updated_at
    nil
  end

end
