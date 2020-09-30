require "json"

require "./record"

module OntarioCovid
  class Status
    # getter records : Hash(Time, OntarioCovid::Record)
    getter records = {} of Time => OntarioCovid::Record

    struct Response
      include JSON::Serializable

      getter help : String
      getter result : Result
    end

    struct Result
      include JSON::Serializable

      getter records : Array(Record)
    end

    def initialize(records)
      records.each_cons_pair do |record1, record2|
        record1.cases = (record1.total_cases - record2.total_cases).abs
        record1.deaths = (record1.total_deaths - record2.total_deaths).abs
        @records[record1.date] = record1
      end

      # records.each do |record|
      # end
    end

    def self.from_json(json : String)
      response = Response.from_json(json)
      records = response.result.records

      self.new(records)
    end

    def latest
      @records.first_value
    end

    def latest_date
      @records.first_key
    end
  end
end
