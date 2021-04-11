require "minitest/autorun"

require "/../src/status.cr"

class StatusTest < Minitest::Test
  def test_parses_json
    json = File.read("test/files/response.json")
    status = OntarioCovid::Status.from_json(json)

    assert_equal Time.local(2021, 4, 10), status.latest_date
    assert_equal [3813, 4227, 3295, 3215, 3065, 2938, 3041], status.cases
    assert_equal [19, 18, 19, 17, 8, 10, 12], status.deaths
    assert_equal 3370, status.seven_day_average

    latest = status.latest
    assert_equal 382152, latest.total_cases
    assert_equal 3813, latest.cases
    assert_equal 19, latest.deaths
  end
end
