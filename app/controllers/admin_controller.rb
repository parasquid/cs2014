class AdminController < ApplicationController
  def dashboard
    @latest_hits = Redirect.latest_hits.each do |hash|
      hash[:date] = Redirect.where(rqst: hash[:url]).order_by(:created_at => :desc).first.created_at
    end.sort {|x, y| y[:date] <=> x[:date]}
    @latest_referrers = Redirect.latest_referrers.each do |hash|
      hash[:date] = Redirect.where(refr: hash[:url]).order_by(:created_at => :desc).first.created_at
      hash[:url] ||= '(direct)'
    end.sort {|x, y| y[:date] <=> x[:date]}
  end
end