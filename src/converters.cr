require "json"

struct Time::LocalConverter
  def self.from_json(value : JSON::PullParser) : Time
    Time.parse_local(value.read_string, "%Y-%m-%dT00:00:00")
  end

  def to_json(value : Time, json : JSON::Builder)
    format(value).to_json(json)
  end
end

struct Int32::NumberConverter
  def self.from_json(pull : JSON::PullParser)
    case pull.kind
    when JSON::PullParser::Kind::Float
      pull.read_float.round.to_i
    when JSON::PullParser::Kind::Int
      pull.read_int.to_i
    else
      raise "Expected float or int but was #{pull.kind}"
    end
  end
end
