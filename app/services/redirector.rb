require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/async'

class Redirector < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :logging
  end
  register Sinatra::Async

  aget "/*" do
    slug = params[:splat].first
    redirect to(slug.split('/').first.numeric? ? challenge_url(slug) : member_url(slug))
  end

  private

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