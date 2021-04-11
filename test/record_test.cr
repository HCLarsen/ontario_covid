require "minitest/autorun"

require "/../src/record.cr"

class RecordTest < Minitest::Test
  def test_parses_json
    json = File.read("test/files/record.json")
    record = OntarioCovid::Record.from_json(json)

    assert_equal 430, record.id
    assert_equal 382152, record.total_cases
    assert_equal 343622, record.total_resolved
    assert_equal 7531, record.total_deaths
  end
end
