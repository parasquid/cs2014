require 'spec_helper'
describe "redirector core" do
  context 'cloudspokes original specifications' do
    it "redirects a url ending with an integer to the challenge url" do
      aget "/2010"
      response.should redirect_to('http://www.cloudspokes.com/challenges/2010')
    end

    it "redirects a url ending with a string to the member url" do
      aget "/mess"
      response.should redirect_to('http://www.cloudspokes.com/members/mess')
    end
  end

  context 'extra specifications for fun and profit' do
    it "allows member urls to have extra paths appended" do
      aget "/talesforce/past_challenges"
      response.should redirect_to('http://www.cloudspokes.com/members/talesforce/past_challenges')
    end

    it "allows challenge urls to have extra paths appended" do
      aget "/2014/participants"
      response.should redirect_to('http://www.cloudspokes.com/challenges/2014/participants')
    end
  end
end