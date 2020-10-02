require "minitest/autorun"

require "/../src/status.cr"

class StatusTest < Minitest::Test
  def test_parses_json
    json = File.read("test/files/response.json")
    status = OntarioCovid::Status.from_json(json)

    assert_equal Time.local(2020, 9, 29), status.latest_date
    assert_equal [554, 700, 491, 435, 409, 409, 335], status.cases
    assert_equal [4, 1, 2, 0, 1, 1, 3], status.deaths
    assert_equal 476, status.seven_day_average

    latest = status.latest
    assert_equal 51085, latest.total_cases
    assert_equal 554, latest.cases
    assert_equal 4, latest.deaths
  end
end
