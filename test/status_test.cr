require "minitest/autorun"

require "/../src/status.cr"

class StatusTest < Minitest::Test
  def test_parses_json
    json = File.read("test/files/response.json")
    status = OntarioCovid::Status.from_json(json)

    latest = status.latest
    assert_equal 51085, latest.total_cases
    assert_equal 4, latest.deaths
    assert_equal 554, latest.cases

    assert_equal Time.local(2020, 9, 29), status.latest_date
  end
end
