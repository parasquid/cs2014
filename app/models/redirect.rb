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

  def self.latest_hits
    perform_map_reduce_on :rqst
  end

  def self.latest_referrers
    perform_map_reduce_on :refr
  end

  private

  def self.map(field)
    "function() { emit(this.#{field.to_s}, { count: 1 }); }"
  end

  def self.perform_map_reduce_on(field)
    reduce = %Q{
      function(key, values) {
        var result = { count: 0 };
        values.forEach(function(value) {
          result.count += value.count;
        });
        return result;
      }
    }
    map_reduce(map(field), reduce).out(inline: true).map do |result|
      { url: result['_id'], count: result['value']['count'].to_i }
    end
  end
end
