require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/async'

class Redirector < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :logging
  end
  register Sinatra::Async

  BASE_URL = "http://www.cloudspokes.com"

  # rename this method to just 'get' for the tests to pass
  # the testing helpers for async_sinatra don't support mounted sinatra apps yet :(
  get "/*" do

    # we run the stats collection in the next_tick method of EventMachine
    # so we don't block this request
    EM.next_tick do
     Redirect.create({
      rqst: request.url,
      refr: request.referrer,
      ip: request.ip,
      ua: request.user_agent
    })
    end

    # place any extra calls or methods here e.g. affiliate tracking stuff
    # make sure to wrap them in EM.next_tick so we don't block this request!

    # and finally we redirect
    slug = params[:splat].first.split('/').last

    redirect to "#{BASE_URL}/" if slug.nil? # http://cloudespok.es/

    redirect to(slug.numeric? ? challenge_url(slug) : member_url(slug))
  end

  def challenge_url(slug)
    "#{BASE_URL}/challenges/#{slug}"
  end

  def member_url(slug)
    "#{BASE_URL}/members/#{slug}"
  end

end

class String
  def numeric?
    !!self.match(/\A[+-]?\d+\Z/)
  end
end