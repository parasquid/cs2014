ParasquidCs2014::Application.routes.draw do

	# we place these up here so it overrides the glob below
	# also, we match two words just in case someone is named stats or admin
  get 'stats/collector'
  get 'admin/dashboard'

  # the meat of the application
  mount Redirector, at: '/'
end
