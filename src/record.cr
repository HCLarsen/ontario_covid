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
    getter resolved : Int32
    @[JSON::Field(key: "Deaths")]
    getter deaths : Int32
    @[JSON::Field(key: "Number of patients hospitalized with COVID-19")]
    getter hospitalized : Int32
    @[JSON::Field(key: "Number of patients in ICU with COVID-19")]
    getter icu : Int32
    @[JSON::Field(key: "Number of patients in ICU on a ventilator with COVID-19")]
    getter ventilator : Int32
  end
end
