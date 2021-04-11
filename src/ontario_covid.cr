require "http"

require "./status"

# TODO: Write documentation for `OntarioCovid`
module OntarioCovid
  VERSION = "0.1.0"

  def self.get_recent_status
    url = "https://data.ontario.ca/api/3/action/datastore_search?limit=8&sort=_id%20desc&resource_id=ed270bb8-340b-41f9-a7c6-e8ef587e6d11"
    data = HTTP::Client.get(url)

    OntarioCovid::Status.from_json(data.body)
  end
end
