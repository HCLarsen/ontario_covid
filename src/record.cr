require "json"

require "./local_converter"

module OntarioCovid
  struct Record
    include JSON::Serializable

    @[JSON::Field(key: "_id")]
    getter id : Int32
    @[JSON::Field(key: "Reported Date", converter: Time::LocalConverter)]
    getter date : Time
    @[JSON::Field(key: "Total Cases")]
    getter total_cases : Int32
    @[JSON::Field(key: "Resolved")]
    getter total_resolved : Int32
    @[JSON::Field(key: "Deaths")]
    getter total_deaths : Int32
    @[JSON::Field(key: "Number of patients hospitalized with COVID-19")]
    getter hospitalized : Int32
    @[JSON::Field(key: "Number of patients in ICU with COVID-19")]
    getter icu : Int32
    @[JSON::Field(key: "Number of patients in ICU on a ventilator with COVID-19")]
    getter ventilator : Int32

    property cases : Int32 = 0
    property deaths : Int32 = 0
    property resolved : Int32 = 0
  end
end
