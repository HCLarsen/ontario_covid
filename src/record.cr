require "json"

require "./converters"

module OntarioCovid
  struct Record
    include JSON::Serializable

    @[JSON::Field(key: "_id")]
    getter id : Int32
    @[JSON::Field(key: "Reported Date", converter: Time::LocalConverter)]
    getter date : Time
    @[JSON::Field(key: "Total Cases", converter: Int32::NumberConverter)]
    getter total_cases : Int32
    @[JSON::Field(key: "Resolved", converter: Int32::NumberConverter)]
    getter total_resolved : Int32
    @[JSON::Field(key: "Deaths", converter: Int32::NumberConverter)]
    getter total_deaths : Int32
    @[JSON::Field(key: "Number of patients hospitalized with COVID-19", converter: Int32::NumberConverter)]
    getter hospitalized : Int32
    @[JSON::Field(key: "Number of patients in ICU due to COVID-19", converter: Int32::NumberConverter)]
    getter icu : Int32
    @[JSON::Field(key: "Number of patients in ICU on a ventilator due to COVID-19", converter: Int32::NumberConverter)]
    getter ventilator : Int32

    property cases : Int32 = 0
    property deaths : Int32 = 0
    property resolved : Int32 = 0
  end
end
