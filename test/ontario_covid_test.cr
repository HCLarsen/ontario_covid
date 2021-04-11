require "minitest/autorun"

require "/../src/ontario_covid.cr"
require "./webmocks.cr"

class OntarioCovidTest < Minitest::Test
  def test_gets_data
    status = OntarioCovid.get_recent_status

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
