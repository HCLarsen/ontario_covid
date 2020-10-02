require "json"

require "./record"

module OntarioCovid
  class Status
    getter records = {} of Time => OntarioCovid::Record

    struct Response
      include JSON::Serializable

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
        record1.resolved = (record1.total_resolved - record2.total_resolved).abs
        @records[record1.date] = record1
      end
    end

    def self.from_json(json : String)
      response = Response.from_json(json)
      records = response.result.records

      self.new(records)
    end

    def latest : OntarioCovid::Record
      @records.first_value
    end

    def latest_date : Time
      @records.first_key
    end

    def cases : Array(Int32)
      @records.values.map { |record| record.cases }
    end

    def deaths : Array(Int32)
      @records.values.map { |record| record.deaths }
    end

    def seven_day_average : Int32
      (self.cases[0,7].sum / 7).to_i
    end
  end
end
