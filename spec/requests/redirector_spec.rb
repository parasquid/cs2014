require 'spec_helper'
describe "redirector core" do
  context 'cloudspokes original specifications' do
    it "redirects a url ending with an integer to the challenge url" do
      get "/2010"
      response.should redirect_to('http://www.cloudspokes.com/challenges/2010')
    end

    it "redirects a url ending with a string to the member url" do
      get "/mess"
      response.should redirect_to('http://www.cloudspokes.com/members/mess')
    end
  end

  context 'edge cases' do
    it "redirects correctly to the challenge if there are extra paths in the middle" do
      get '/another/REFERRAL/path/that/ends/with/an/integer/2010'
      response.should redirect_to('http://www.cloudspokes.com/challenges/2010')
    end

    it "redirects correctly to the member if there are extra paths in the middle" do
      get '/another/REFERRAL/path/that/ends/with/a/string/mess'
      response.should redirect_to('http://www.cloudspokes.com/members/mess')
    end

    it 'redirects correctly to the member if the query params end with a string' do
      get '/mess?challenge=2014'
      response.should redirect_to('http://www.cloudspokes.com/members/mess')
    end

    it 'redirects correctly to the challenge if the query params end with an integer' do
      get '/2010?member=mess'
      response.should redirect_to('http://www.cloudspokes.com/challenges/2010')
    end

  end

end