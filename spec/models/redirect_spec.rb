require 'spec_helper'

describe Redirect do
  it 'computes the latest hits' do
    FactoryGirl.create_list(:redirect, 6, rqst: '/foo')
    FactoryGirl.create_list(:redirect, 3, rqst: '/bar')
    FactoryGirl.create_list(:redirect, 5, rqst: '/42')

    # the =~ operator means that two objects are euqal if their contents are equal, without regard for order
    Redirect.latest_hits.should =~ [ {url: '/foo', count: 6}, {url: '/bar', count: 3}, {url: '/42', count: 5} ]
  end
  it 'computes the latest referrers' do
    FactoryGirl.create_list(:redirect, 6, refr: '/foo')
    FactoryGirl.create_list(:redirect, 3, refr: '/bar')
    FactoryGirl.create_list(:redirect, 5, refr: '/42')

    # the =~ operator means that two objects are euqal if their contents are equal, without regard for order
    Redirect.latest_referrers.should =~ [ {url: '/foo', count: 6}, {url: '/bar', count: 3}, {url: '/42', count: 5} ]
  end
end
