class AdminController < ApplicationController
  def dashboard
    @latest_hits = Redirect.latest_hits.each do |hash|
      hash[:date] = Redirect.where(rqst: hash[:url]).order_by(:created_at => :desc).first.created_at
    end
    @latest_referrers = Redirect.latest_referrers.each do |hash|
      hash[:date] = Redirect.where(refr: hash[:url]).order_by(:created_at => :desc).first.created_at
      hash[:url] ||= '(direct)'
    end
  end
end