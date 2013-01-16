require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/async'

class Redirector < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :logging
  end
  register Sinatra::Async

  # rename this method to just 'get' for the tests to pass
  # the testing helpers for async_sinatra don't support mounted sinatra apps yet :(
  aget "/*" do

    # we run the stats collection in the next tick of EventMachine
    # so we don't block this request
    EM.next_tick do
     Redirect.create rqst: request.url,
      refr: request.referrer,
      ip: request.ip,
      ua: request.user_agent
   end

    # and finally we redirect
    slug = params[:splat].first.split('/').last
    redirect to(slug.numeric? ? challenge_url(slug) : member_url(slug))
  end

  def challenge_url(slug)
    "http://www.cloudspokes.com/challenges/#{slug}"
  end

  def member_url(slug)
    "http://www.cloudspokes.com/members/#{slug}"
  end

end

class String
  def numeric?
    !!self.match(/\A[+-]?\d+\Z/)
  end
end