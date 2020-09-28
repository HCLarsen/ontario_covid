require "minitest/autorun"

require "/../src/record.cr"

class RecordTest < Minitest::Test
  def test_parses_json
    json = File.read("test/files/record.json")
    record = OntarioCovid::Record.from_json(json)

    assert_equal 236, record.id
    assert_equal 50531, record.total_cases
    assert_equal 43127, record.resolved
    assert_equal 2840, record.deaths
  end
end
