require 'spec_helper'
describe "redirector core" do
  it "redirects a url ending with an integer to the challenge url" do
    get "/2010"
    puts response.body
    response.should redirect_to('http://www.cloudspokes.com/challenges/2010')
  end

  it "redirects a url ending with a string to the member url" do
    get "/mess"
    response.should redirect_to('http://www.cloudspokes.com/members/mess')
  end
end