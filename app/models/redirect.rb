class Redirect
  include Mongoid::Document
  field :rqst, type: String
  field :refr, type: String
  field :ip, type: String
  field :ua, type: String
end
