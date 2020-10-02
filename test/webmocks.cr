require "webmock"

WebMock.stub(:get, "https://data.ontario.ca/api/3/action/datastore_search?limit=8&sort=_id%20desc&resource_id=ed270bb8-340b-41f9-a7c6-e8ef587e6d11").to_return(status: 200, body: File.read("test/files/response.json"))
