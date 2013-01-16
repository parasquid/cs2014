class Redirect
  include Mongoid::Document
  include Mongoid::Timestamps

  field :rqst, type: String
  index ssn:1

  field :refr, type: String
  index refr:1

  field :ip, type: String
  index ip:1

  field :ua, type: String
  index ua:1

  REDUCE = %Q{
    function(key, values) {
      var result = { count: 0 };
      values.forEach(function(value) {
        result.count += value.count;
      });
      return result;
    }
  }

  def self.latest_hits
    map = %Q{
      function() {
        emit(this.rqst, { count: 1 });
      }
    }
    map_reduce(map, REDUCE).out(inline: true).map do |result|
      { url: result['_id'], count: result['value']['count'].to_i }
    end
  end

  def self.latest_referrers
    map = %Q{
      function() {
        emit(this.refr, { count: 1 });
      }
    }
    map_reduce(map, REDUCE).out(inline: true).map do |result|
      { url: result['_id'], count: result['value']['count'].to_i }
    end
  end
end
